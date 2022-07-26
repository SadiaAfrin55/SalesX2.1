import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/Attendence/AttendanceActivity/attendance_activity_cubit.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Attendence/attendance_activity_card.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../Components/attendance_object_card.dart';


class OmAttendenceSurvey extends StatefulWidget {
  const OmAttendenceSurvey({Key? key}) : super(key: key);

  @override
  _OmAttendenceSurveyState createState() => _OmAttendenceSurveyState();
}

class _OmAttendenceSurveyState extends State<OmAttendenceSurvey> {
  bool isVisible = true;
  double _height = 61;
  String? linemanagerid;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linemanagerid = tokenx.get('linemanagerid');
      BlocProvider.of<AttendanceActivityCubit>(context).attendanceActivity(
          linemanagerid!);
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Attendance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back, color: Colors.black, size: 27,),
              ),
            ),
            toolbarHeight: 60,
            elevation: 0.5,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Column(
                children: [
                  // Column(
                  //   children: [
                  //     Container(
                  //       height: _height,
                  //       color: const Color(0xFFE6F2FE),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Expanded(
                  //               child: Row(
                  //                 children: [
                  //                   Expanded(
                  //                       flex:1,
                  //                       child: SvgPicture.asset('assets/icons/filter_icon.svg')),
                  //                   Expanded(
                  //                       flex: 8,
                  //                       child: Text('Filter',style: TextStyle(fontSize:16,fontWeight:FontWeight.w600,color: Color(0xFF0180F5),))),
                  //                 ],
                  //               ),
                  //             ),

                  //             InkWell(
                  //               onTap: (){
                  //                 setState(() {
                  //                   isVisible = !isVisible;
                  //                 });
                  //               },
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   isVisible?
                  //                   SvgPicture.asset('assets/icons/filter-side.svg'):
                  //                   SvgPicture.asset('assets/icons/filter-back.svg'),
                  //                 ],
                  //               ),
                  //             ),

                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: (){
                  //         setState(() {
                  //           _height = 264;
                  //         });
                  //       },
                  //       child: Visibility(
                  //         visible: !isVisible,
                  //         child: Align(
                  //           alignment: Alignment.bottomCenter,
                  //           child: AnimatedContainer(
                  //             duration: const Duration(seconds: 1),
                  //             curve: Curves.easeInOut,
                  //             color: Colors.green,
                  //             height: _height,
                  //             child: Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     Column(
                  //                       children: [

                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  BlocBuilder<AttendanceActivityCubit, AttendanceActivityState>(
                    builder: (context, state) {
                      if(state is !attendanceActivityData){
                        return Center(child: CircularProgressIndicator(),);
                      }

                      var data = (state as attendanceActivityData).object;
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return AttendenceActivityCard(
                              img: data[index].name[0].toString(),
                              checkOut: data[index].outtime,
                              checkIn: data[index].normalintime,
                              attendenceDate: "",
                              status: "",
                            );
                          }
                      );
                    },
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
