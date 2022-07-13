import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Bloc/List/list_cubit.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/SecSale/sec_sale_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';

class SecSalesHistory extends StatefulWidget {
  const SecSalesHistory({Key? key}) : super(key: key);

  @override
  _SecSalesHistoryState createState() => _SecSalesHistoryState();
}

class _SecSalesHistoryState extends State<SecSalesHistory> {
  bool isVisible = true;
  double _height = 61;

  @override
  void initState() {
    BlocProvider.of<ListCubit>(context).loadSecSale();
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
            title: const Text('Sales',
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
                    if(state is !GetSecSale){
                      return Center(child: Text("Loading"),);
                    }
                    var data = (state as GetSecSale).saleResponse;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data!.sales!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, SEC_SALES_DETAILS_PAGE,
                                    arguments: {
                                      'name': data.sales![index].customername,
                                      'mobile': data.sales![index].customermobile,
                                      'age': data.sales![index].age,
                                      'email': data.sales![index].customeremail,
                                      'remark': data.sales![index].remark,
                                      'takenname': data.sales![index].username,
                                      'date': data.sales![index].date,
                                      'productname': data.sales![index].productName,
                                      'productprice': data.sales![index].price,
                                    });
                              },
                              child: SecSaleCard(
                                name: data.sales![index].productName,
                                linemanagername: data.sales![index].username,
                                date: data.sales![index].date,
                                price: data.sales![index].price,
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
