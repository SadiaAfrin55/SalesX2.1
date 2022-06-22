
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:salesx_new_project/Presentation/Widgets/Button/CustomButoon/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Bloc/Store/store_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/TextFields/materialTextFieldTwo.dart';
import '../../main_screen.dart';

class StoreLanLotUpdate extends StatefulWidget {
  final String? storeId;

  const  StoreLanLotUpdate({Key? key, this.storeId}) : super(key: key);
  @override
  _StoreLanLotUpdateState createState() => _StoreLanLotUpdateState();
}

class _StoreLanLotUpdateState extends State<StoreLanLotUpdate> {


  TextEditingController lat= TextEditingController();
  TextEditingController lon= TextEditingController();
  bool circle=false;
  String? _latLng;
  final _globalkey = GlobalKey<FormState>();

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
  @override
  void initState() {
    // TODO: implement initState
    getCureentLocation();
    super.initState();
  }

  void logOut(BuildContext context) async {
    var users = await Hive.openBox('users');
    users.clear();
    Navigator.pushReplacementNamed(context, LOGIN_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          children: [
            dhashboard(context)
          ],
        )
    );
  }
  Widget dhashboard(context){
    return _latLng==null?const Center(
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
        elevation: 30.0,
        shadowColor: Colors.blueAccent,
        color: Colors.blue,
        child: Container(
          padding: EdgeInsets.only(left: 0,right:0,top: 0),
          child: Column(
            children: [
              SizedBox(height:3,),
              Flexible(
                  flex:100,
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          child: Form(
                            key: _globalkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                MaterialTextFieldTwo(lable: "Lat",controller: lat,hintText: "Enter Lan",),
                                SizedBox(height: 14,),

                                MaterialTextFieldTwo(lable: "Lon",controller: lon,hintText: "Enter Lot",),
                                SizedBox(height: 34,),
                                circle?Center(child: CircularProgressIndicator(),): CustomButton(
                                  title: "Update",
                                  onTap: (){

                                  setState(() {
                                    circle=true;
                                  });
                                  BlocProvider.of<StoreCubit>(context).updateStoreLanLot(widget.storeId!,lat.text,lon.text);
                                  Navigator.pushReplacement(context, PageTransition(MainScreen()));

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
    );
  }



}
