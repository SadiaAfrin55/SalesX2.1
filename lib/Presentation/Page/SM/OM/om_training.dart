import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/Attendence/AttendanceActivity/attendance_activity_cubit.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Attendence/attendance_activity_card.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/Attendence/training_activity_card.dart';
import '../Components/attendance_object_card.dart';


class OmTrainingActivity extends StatefulWidget {
  const OmTrainingActivity({Key? key}) : super(key: key);

  @override
  _OmTrainingActivityState createState() => _OmTrainingActivityState();
}

class _OmTrainingActivityState extends State<OmTrainingActivity> {
  bool isVisible = true;
  double _height = 61;
  String? userid;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userid = tokenx.get('userId');
      BlocProvider.of<AttendanceActivityCubit>(context).trainingActivity(
          userid!);
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
            title: const Text('Training',
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      if(state is !trainingActivityData){
                        return Center(child: CircularProgressIndicator(),);
                      }

                      var data = (state as trainingActivityData).trainingdata;
                      return data!.isEmpty?Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/nodata.png'),
                              Text('No data available',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.8)
                              ),),
                            ],
                          ),
                        ),
                      ):ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return TrainingActivityCard(
                              img: data[index].trainingAtd.photo,
                              checkIn: data[index].trainingAtd.time,
                              attendenceDate: data[index].dateid,
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
