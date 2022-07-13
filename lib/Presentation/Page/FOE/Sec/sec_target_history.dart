
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../Bloc/List/list_cubit.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
class SecTargetHistory extends StatefulWidget {
  final String? cusname;
  final String? sale;
  final String? target;
  final String? targetAchive;
  const SecTargetHistory({Key? key,
    this.cusname,
    this.sale,
    this.targetAchive,
    this.target,
  }) : super(key: key);

  @override
  _SecTargetHistoryState createState() => _SecTargetHistoryState();
}

class _SecTargetHistoryState extends State<SecTargetHistory> {

  String? linemanagerid;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linemanagerid = tokenx.get('linmanagerid');
      print("limmmmmm: " + linemanagerid!);
      //BlocProvider.of<ListCubit>(context).loadSec(linemanagerid!);
      BlocProvider.of<ListCubit>(context).loadSecdata(linemanagerid!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
            title:  Text('${widget.cusname}  Target',
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
                // Container(
                //   height: 136,
                //   color: const Color(0xFFE6F2FE),
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         children: [
                //           SvgPicture.asset('assets/icons/filter_icon.svg',color: Colors.black,),
                //           const SizedBox(width: 6,),
                //           const Text('Select Month',style: TextStyle(
                //               fontSize: 12,
                //               fontWeight: FontWeight.w500,
                //               color: Color(0xFF232C2E)
                //           ),),
                //         ],
                //       ),
                //       const Text('Result showed based on your select month',style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w500,
                //           color: Color(0xFF232C2E)
                //       ),),
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Row(
                              children:  [
                                SvgPicture.asset('assets/icons/empty-wallet.svg'),
                                const SizedBox(width: 8,),
                                const Text('Target by amount',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 168,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xFFF5F7F8)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:6,
                                    child: Center(
                                      child: CircularPercentIndicator(
                                        animation: true,
                                        radius: 70.0,
                                        lineWidth: 25.0,
                                        percent: double.parse(widget.targetAchive.toString()),
                                        center: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('${widget.targetAchive}'+"%",style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF232C2E),
                                            ),),
                                            SizedBox(height: 2,),
                                            Text("Achive",style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF232C2E),
                                            ),),
                                          ],
                                        ),
                                        backgroundColor: Color(0xFFC2E2FF),
                                        progressColor: Color(0xFF0180F5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:6,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Text('Target Amount',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color:Color(0xFF232C2E)

                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            SvgPicture.asset('assets/icons/takaIcon.svg'),
                                            const SizedBox(width: 4,),
                                             Text('${widget.target}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color:Color(0xFF232C2E)

                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16,),
                                        const Text('Achive Amount',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color:Color(0xFF232C2E)

                                          ),
                                        ),
                                        const SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            SvgPicture.asset('assets/icons/takaIcon.svg'),
                                            const SizedBox(width: 4,),
                                             Text('${widget.targetAchive}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color:Color(0xFF0180F5)

                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32,),
                            // Row(
                            //   children: [
                            //     SvgPicture.asset('assets/icons/target-chart.svg'),
                            //     const SizedBox(width: 8,),
                            //     const Text('Target by quantity',
                            //       style: TextStyle(
                            //           fontSize: 14,
                            //           fontWeight: FontWeight.w700
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(height: 16,),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   height: 168,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(4),
                            //       color: const Color(0xFFF5F7F8)
                            //   ),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         flex:6,
                            //         child: Center(
                            //           child: CircularPercentIndicator(
                            //             radius: 70.0,
                            //             lineWidth: 25.0,
                            //             percent: 0.8,
                            //             backgroundColor: const Color(0xFFC2E2FF),
                            //             progressColor: const Color(0xFF0180F5),
                            //           ),
                            //         ),
                            //       ),
                            //       Expanded(
                            //         flex:6,
                            //         child: Column(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             const Text('Target Amount',
                            //               style: TextStyle(
                            //                   fontSize: 11,
                            //                   fontWeight: FontWeight.w400,
                            //                   color:Color(0xFF232C2E)
                            //
                            //               ),
                            //             ),
                            //             const SizedBox(height: 4,),
                            //             Row(
                            //               children: [
                            //                 SvgPicture.asset('assets/icons/takaIcon.svg'),
                            //                 const SizedBox(width: 4,),
                            //                 const Text('3,00,000',
                            //                   style: TextStyle(
                            //                       fontSize: 15,
                            //                       fontWeight: FontWeight.w700,
                            //                       color:Color(0xFF232C2E)
                            //
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //             const SizedBox(height: 16,),
                            //             const Text('Achive Amount',
                            //               style: TextStyle(
                            //                   fontSize: 11,
                            //                   fontWeight: FontWeight.w400,
                            //                   color:Color(0xFF232C2E)
                            //
                            //               ),
                            //             ),
                            //             const SizedBox(height: 4,),
                            //             Row(
                            //               children: [
                            //                 SvgPicture.asset('assets/icons/takaIcon.svg'),
                            //                 const SizedBox(width: 4,),
                            //                 const Text('3,00,000',
                            //                   style: TextStyle(
                            //                       fontSize: 15,
                            //                       fontWeight: FontWeight.w700,
                            //                       color:Color(0xFF0180F5)
                            //
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
