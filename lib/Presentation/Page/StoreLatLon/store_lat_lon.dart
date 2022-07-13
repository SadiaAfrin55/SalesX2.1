
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Presentation/Widgets/TextFields/filledTextField.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Bloc/Attendence/attendence_cubit.dart';
import '../../../Bloc/Store/store_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../main_screen.dart';



class StoreLatLon extends StatefulWidget {
  @override
  _StoreLatLonState createState() => _StoreLatLonState();
}

class _StoreLatLonState extends State<StoreLatLon> with SingleTickerProviderStateMixin{

  bool iscollapse=true;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var list;
  var numberOfItem;
  var logger = Logger();
  String? role;
  String? storeId;


  TextEditingController lat= TextEditingController();
  TextEditingController lon= TextEditingController();
  bool circle=false;
  String? _latLng;
  final _globalkey = GlobalKey<FormState>();



  @override

  LocalDataGet _localDataGet = LocalDataGet();

  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    getCureentLocation();
  }

  void getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      storeId = tokenx.get('storeId');
      Logger().d("widget shopId "+storeId!);
      role = tokenx.get('role');

      if(role=="SEC") {
        Logger().d("call api");
        BlocProvider.of<StoreCubit>(context).checkStoreLanLot(storeId!);
      }

      if(role=="OM") {
        Logger().d("call api");
        BlocProvider.of<StoreCubit>(context).checkStoreLanLot(storeId!);
      }

    });
  }


  void getCureentLocation()async{
    var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition=await Geolocator.getLastKnownPosition();
    print(lastPosition);
    print(possition.latitude);
    print(possition.longitude);

    setState(() {
      lat.text=possition.latitude.toString();
      lon.text=possition.longitude.toString();
      _latLng=possition.latitude.toString();
    });

  }
  void logOut(BuildContext context) async {
    var users = await Hive.openBox('users');
    users.clear();
    Navigator.pushReplacementNamed(context, LOGIN_PAGE);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child:BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          if(!(state is CheckStoreLanLot)){
            return Center(child: CircularProgressIndicator());
          }
          final dataLan=(state as CheckStoreLanLot).isStoreLanLot;
          return dataLan!?Container():InkWell(
            onTap: (){

              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: _latLng==null?const Center(
                          child: CircularProgressIndicator(),
                        ): BlocListener<StoreCubit, StoreState>(
                          listener: (context, state) {
                            if(state is UpdateStoreLan){
                              setState(() {
                                circle=false;
                                Navigator.pushReplacement(context, PageTransition(MainScreen()));
                                logOut(context);
                                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                              });
                            }
                          },
                          child: Material(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: 250,
                              padding: EdgeInsets.only(left: 0,right:0,top: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height:3,),
                                  Flexible(
                                      child: Material(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                              child: Form(
                                                key: _globalkey,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Lat',style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black
                                                    ),),
                                                    const SizedBox(height: 8,),
                                                    FilledTextField(controller: lat,hintText: "Enter Lan",readOnly: false,),
                                                    const SizedBox(height: 16,),
                                                    const Text('Lon',style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black
                                                    ),),
                                                    const SizedBox(height: 8,),
                                                    FilledTextField(controller: lon,hintText: "Enter Lot",readOnly: false,),
                                                    SizedBox(height: 34,),
                                                    circle?Center(child: CircularProgressIndicator(),): CustomButton(
                                                      title: "Update",
                                                      onTap: (){

                                                        setState(() {
                                                          circle=true;
                                                        });
                                                        BlocProvider.of<StoreCubit>(context).updateStoreLanLot(storeId!,lat.text,lon.text);

                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              );

              // Navigator.pushNamed(context, STORE_UPDATE,arguments: {
              //   'storeId':storeId
              // });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 88,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7F8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: SvgPicture.asset('assets/icons/profile_latlon.svg')),
                  Expanded(
                    flex: 2,
                    child: Text('Update Your \n Store Coordinates',style: TextStyle(
                        fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.5)
                    ),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 36,
                      width: 73,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0180F5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Update',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white),)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}

