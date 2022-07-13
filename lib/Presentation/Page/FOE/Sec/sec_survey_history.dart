import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Bloc/List/list_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/AppBar/home_custom_appbar.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';

class SecSurveyHistory extends StatefulWidget {
  const SecSurveyHistory({Key? key}) : super(key: key);

  @override
  _SecSurveyHistoryState createState() => _SecSurveyHistoryState();
}

class _SecSurveyHistoryState extends State<SecSurveyHistory> {
  bool isVisible = true;
  double _height = 61;


  @override
  void initState() {
    BlocProvider.of<ListCubit>(context).loadSecSurvey();
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
            title: const Text('Survey',
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
                    if(state is !GetSecSurvey){
                      return Center(child: Text("Loading"),);
                    }
                    var data = (state as GetSecSurvey).secSurveyResponse;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, SEC_SURVEY_DETAILS_PAGE,
                                    arguments: {
                                      'name': data.surveys![index].customername,
                                      'phone': data.surveys![index].customercontactno,
                                      'age': data.surveys![index].customerage,
                                      'email': data.surveys![index].customeremail,
                                      'interestedin': data.surveys![index].interestedin,
                                      'minbud': data.surveys![index].customerbudget,
                                      'maxbud': data.surveys![index].pricerange,
                                      'date': data.surveys![index].dataIn,
                                    });
                              },
                              child: SurveyCard(
                                name: data.surveys![index].customername,
                                time: data.surveys![index].dataIn,
                              ),
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
