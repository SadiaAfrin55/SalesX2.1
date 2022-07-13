
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Bloc/List/list_cubit.dart';

import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/Attendence/shoplist_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
class FoeAttendenceSurvey extends StatefulWidget {
  const FoeAttendenceSurvey({Key? key}) : super(key: key);

  @override
  _FoeAttendenceSurveyState createState() => _FoeAttendenceSurveyState();
}

class _FoeAttendenceSurveyState extends State<FoeAttendenceSurvey> {

  DateTime? _dateTime;

  String? visitdate = DateTime.now().toString();
  var dateParse;
  String? month;
  String? useId;
  String? linemanagerId;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      useId = tokenx.get('userId');
      linemanagerId = tokenx.get('linemanagerid');
      BlocProvider.of<ListCubit>(context).GetAtd(visitdate!,linemanagerId!);
    });
  }

  @override
  void initState() {
    var date = new DateTime.now().toString();
    dateParse = DateTime.parse(date);

    if(dateParse.month.toString().length<2){
      month="0"+dateParse.month.toString();
    }else{
      // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
      month=dateParse.month.toString();
    }

    var formattedDate = "${dateParse.year}-$month-${'0'+dateParse.day.toString()}";
    visitdate=formattedDate.toString();

    getToken();
    super.initState();
  }

  bool isVisible = true;
  double _height = 61;

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
                //
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
                //
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
                //
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



                BlocBuilder<ListCubit, ListState>(
                  builder: (context, state) {
                    if(state is !SecAtd){
                      return Center(child: CircularProgressIndicator());
                    }
                    var data = (state as SecAtd).atdInfoResponse;

                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: data!.objectarr!.isEmpty?Container(
                        margin: const EdgeInsets.only(top: 10,bottom: 450),
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
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.objectarr!.length,
                          itemBuilder: (context,index){
                            return ShopListCard(
                              shopname: data.objectarr![index].name,
                              attendenceDate: data.objectarr![index].phoneNumber,
                              time: data.objectarr![index].trainingintime.toString(),
                            );
                          }
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
