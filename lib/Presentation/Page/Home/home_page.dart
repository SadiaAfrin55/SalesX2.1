import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:salesx_new_project/Bloc/Attendence/attendence_cubit.dart';
import 'package:salesx_new_project/Bloc/Dayoff/dayoff_cubit.dart';
import 'package:salesx_new_project/Bloc/DayoffAttendance/dayoff_attendance_cubit.dart';
import 'package:salesx_new_project/Presentation/Page/Login/login_page.dart';
import 'package:salesx_new_project/Presentation/Widgets/Button/CustomButoon/custom_button.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/AleartDialog/alert_dialog.dart';
import '../../Widgets/AppBar/home_custom_appbar.dart';
import '../../Widgets/Button/HomePage/big_button_icon.dart';
import '../../main_screen.dart';
import '../Dayoff/check_dayoff_attendance.dart';
import '../Inventory/inventory_list.dart';
import '../Leave/leave_history.dart';
import '../Profile/profile_page.dart';
import '../Sales/sales_history.dart';
import '../StoreLatLon/store_lat_lon.dart';
import '../Survey/survey_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? role;
  String? userId;
  String? shopId;
  bool checkAtten = false;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      role = tokenx.get('role');
      shopId = tokenx.get('storeId');
      userId = tokenx.get('userId');
      print("shopId: "+shopId!);
      BlocProvider.of<DayoffAttendanceCubit>(context).chekUserDayoffAttendance(userId!);
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: CustomAppBar()
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 21,),

                  Column(
                    children: [
                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"? Container(
                            color: Colors.lightBlue,
                            child: SizedBox(
                              height: 21,
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'You can’t create any sales or\n survey today.', style: TextStyle(fontSize:14,fontWeight: FontWeight.w400,color: Colors.black)),
                                      TextSpan(text: ' It’s your dayclose',style: TextStyle(fontSize:14,fontWeight: FontWeight.w400,color: Colors.redAccent)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ):SizedBox(
                              height: 5,
                              child: Container(color:Colors.lime,child: Text('')));
                        },
                      )

                    ],
                  ),

                  //const SizedBox(height: 21,),
                  Center(child: SvgPicture.asset("assets/images/banner.svg", semanticsLabel: 'Acme Logo',width: MediaQuery.of(context).size.width*0.9,)),
                  const SizedBox(height: 24,),
                  StoreLatLon(),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0,right: 16,bottom: 10),
                    child: Text("Your work list",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
                  ),


                  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 17.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio:6/3
                    ),
                    children: [
                      BigButtonIcon(text: "Attendance",color: const Color(0xFFFEEBEF),image: "assets/icons/cardIcon/Attendance.svg",tap: (){
                        Navigator.pushNamed(context, ATTENDANCE);
                      },),


                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"?BigButtonIcon(text: "Sales",color: const Color(0xFFFFF6E1),image: "assets/icons/cardIcon/My survey.svg",tap: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    content: AleartDialogue(
                                      pressed: (){
                                        Navigator.pushReplacement(context, PageTransition(SalesHistory()));
                                      }
                                    )
                                  );
                                }
                            );
                          },):BigButtonIcon(text: "Sales",color: const Color(0xFFFFF6E1),image: "assets/icons/cardIcon/My survey.svg",tap: (){
                                            Navigator.pushNamed(context, SALES_CREATE_PAGE);
                                          },);
                        },
                      ),

                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"?BigButtonIcon(text: "Survey",color: const Color(0xFFE2FDED),image: "assets/icons/cardIcon/Survey.svg",tap: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                      content: AleartDialogue(
                                          pressed: (){
                                            Navigator.pushReplacement(context, PageTransition(SurveyHistory()));
                                          }
                                      )
                                  );
                                }
                            );
                          },): BigButtonIcon(text: "Survey",color: const Color(0xFFE2FDED),image: "assets/icons/cardIcon/Survey.svg",tap: (){
                            Navigator.pushNamed(context, SURVEY_PAGE);
                          },);
                        },
                      ),

                      BigButtonIcon(text: "Target",color: const Color(0xFFE1F3FF),image: "assets/icons/cardIcon/Target.svg",tap: (){
                         Navigator.pushNamed(context, TARGET_PAGE);
                      },),

                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"?BigButtonIcon(text: "Inventory",color: const Color(0xFFE2E1FF),image: "assets/icons/cardIcon/inventory.svg",tap: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                      content: AleartDialogue(
                                          pressed: (){
                                            Navigator.pushReplacement(context, PageTransition(InventoryList()));
                                          }
                                      )
                                  );
                                }
                            );
                          },): BigButtonIcon(text: "Inventory",color: const Color(0xFFE2E1FF),image: "assets/icons/cardIcon/inventory.svg",tap: (){
                            Navigator.pushNamed(context, INVENTORY_PAGE);
                          },);
                        },
                      ),

                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"?BigButtonIcon(text: "Leave",color: const Color(0xFFF1E1FF),image: "assets/icons/cardIcon/Leave.svg",tap: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                      content: AleartDialogue(
                                          pressed: (){
                                            Navigator.pushReplacement(context, PageTransition(LeaveHistory()));
                                          }
                                      )
                                  );
                                }
                            );
                          },): BigButtonIcon(text: "Leave",color: const Color(0xFFF1E1FF),image: "assets/icons/cardIcon/Leave.svg",tap: (){
                            Navigator.pushNamed(context, LEAVE_PAGE);
                          },);
                        },
                      ),


                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"?BigButtonIcon(text: "Training",color: const Color(0xFFFFEFE0),image: "assets/icons/cardIcon/Tr Attendance.svg",tap: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                      content: AleartDialogue(
                                          pressed: (){
                                            Navigator.pushReplacement(context, PageTransition(MainScreen()));
                                          }
                                      )
                                  );
                                }
                            );
                          },): BigButtonIcon(text: "Training",color: const Color(0xFFFFEFE0),image: "assets/icons/cardIcon/Tr Attendance.svg",tap: (){
                            Navigator.pushNamed(context, TRAINING_PAGE);
                          },);
                        },
                      ),


                      BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
                        builder: (context, state) {
                          if(state is !CheckUserDayoffAtendance){
                            return Center(child: Text("loading"),);
                          }
                          var data = (state as CheckUserDayoffAtendance).attendance;

                          return data=="yes"?BigButtonIcon(text: "Feedback",color: const Color(0xFFE0EDFF),image: "assets/icons/cardIcon/Feedback.svg",tap: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                      content: AleartDialogue(
                                          pressed: (){
                                            Navigator.pushReplacement(context, PageTransition(MainScreen()));
                                          }
                                      )
                                  );
                                }
                            );
                          },): BigButtonIcon(text: "Feedback",color: const Color(0xFFE0EDFF),image: "assets/icons/cardIcon/Feedback.svg",tap: (){
                            Navigator.pushNamed(context, FEEDBACK_PAGE);
                          },);
                        },
                      ),


                    ],
                  ),
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
