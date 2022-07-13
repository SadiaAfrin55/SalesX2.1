
import 'dart:io';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../main_screen.dart';
import '../../OM/OmDayoff/om_dayoff.dart';
import '../../Profile/Dayoff/mark_foe_dayoff.dart';
import '../../Profile/ProfileComponents/moreOption_components.dart';


class FoeMoreComponents extends StatefulWidget {
  const FoeMoreComponents({Key? key}) : super(key: key);

  @override
  State<FoeMoreComponents> createState() => _FoeMoreComponentsState();
}

class _FoeMoreComponentsState extends State<FoeMoreComponents> {

  bool marking = false;
  String? storeid;
  String? businessunit;
  String? userid;
  String? addrerss;
  String? lat;
  String? lon;
  File? _image;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      storeid = tokenx.get('storeId');
      businessunit = tokenx.get('businessUnit');
      userid = tokenx.get('userId');
    });
  }

  void getCureentLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("'Location Permission Denied'");
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //location name
    List<Placemark> placemarks =
    await placemarkFromCoordinates(possition.latitude, possition.longitude);

    // print(placemarks);
    setState(() {
      lat = possition.latitude.toString();

      lon = possition.longitude.toString();

      addrerss = placemarks[0].name.toString() +
          "," +
          placemarks[0].street.toString() +
          "," +
          placemarks[0].locality.toString() +
          "," +
          placemarks[0].postalCode.toString() +
          "," +
          placemarks[0].subLocality.toString() +
          "," +
          placemarks[0].subAdministrativeArea.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCureentLocation();
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 16,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Note : The above calculations are as current month',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:Color(0xFF232C2E),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 24.0),
                    child: const Divider(color: Color(0xFFEDEFEF),thickness: 1,)),
                const Text('History',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8E9191),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ATTENDANCE_HISTORY);
                        },
                        child: MoreOptionsCard(
                          image: SvgPicture.asset('assets/icons/attendenceHistory.svg'),
                          title: 'Attendance History',
                          color: Color(0xFFFFE5E0),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, LEAVE_HISTORY);
                        },
                        child: MoreOptionsCard(
                          image: SvgPicture.asset('assets/icons/leave_history.svg'),
                          title: 'Leave History',
                          color: Color(0xFFFFF6E1),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, VISIT_HISTORY_PAGE);
                        },
                        child: MoreOptionsCard(
                          image: SvgPicture.asset('assets/icons/cardIcon/visit.svg',height: 16,color: const Color(0xFFC47CFD)),
                          title: 'Visit History',
                          color: const Color(0xFFF1E1FF),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, SEC_LIST_PAGE);
                        },
                        child: MoreOptionsCard(
                          image: SvgPicture.asset('assets/icons/cardIcon/glass.svg',height: 16,),
                          title: 'SEC’s List',
                          color: const Color(0xFFE8E7FD),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showAlertDialog(context);
                        },
                        child: MoreOptionsCard(
                          image: SvgPicture.asset('assets/icons/dayClose.svg'),
                          title: 'Day close',
                          color: Color(0xFFFFEFE0),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          logOut(context);
                        },
                        child: MoreOptionsCard(
                          image: SvgPicture.asset('assets/icons/Logout.svg',height: 16,),
                          title: 'Logout',
                          color: const Color(0xFFFCE4E4),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),

    );
  }


  void logOut(BuildContext context) async {
    var users = await Hive.openBox('users');
    users.clear();
    Navigator.pushReplacementNamed(context, LOGIN_PAGE);
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/daycloseIcon.svg'),
            const Text(
              "Want to call it a day?",
              style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: 54,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0XFFE1F0FF)),
                            child: const Text(
                              "No",
                              style:
                              TextStyle(color: kPrimaryColor, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OmDayoff()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            height: 54,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFF0180F5)),
                            child: const Text(
                              "Yes",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ),


                  // Expanded(
                  //   child: Padding(
                  //       padding: const EdgeInsets.all(6.0),
                  //       child: InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             marking = true;
                  //           });
                  //           Navigator.pop(context);
                  //           print(_image);
                  //           print(storeid);
                  //           print(businessunit);
                  //           print(userid);
                  //           print(addrerss);
                  //           BlocProvider.of<AttendenceCubit>(context)
                  //               .giveDayoffAttendance(_image!,storeid!,businessunit!,userid!,addrerss!);
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.all(16),
                  //           height: 54,
                  //           width: MediaQuery.of(context).size.width,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(6),
                  //               color: Color(0xFF0180F5)),
                  //           child: const Text(
                  //             "Yes",
                  //             style:
                  //             TextStyle(color: Colors.white, fontSize: 16),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
