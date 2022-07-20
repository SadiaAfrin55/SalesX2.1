
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../Widgets/Card/Attendence/shoplist_card.dart';

class VisitHistory extends StatefulWidget {
  const VisitHistory({Key? key}) : super(key: key);

  @override
  _VisitHistoryState createState() => _VisitHistoryState();
}

class _VisitHistoryState extends State<VisitHistory> {
   DateTime? _dateTime;

  String? visitdate = DateTime.now().toString();
  var dateParse;
  String? month;
  String? useId;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      useId = tokenx.get('userId');
      BlocProvider.of<VisitCubit>(context).loadVisitInfo(visitdate!,useId!);
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

    var formattedDate = "${dateParse.year}-$month-${dateParse.day.toString()}";
    visitdate=formattedDate.toString();

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
              title: const Text('Visit History',
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
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  children: [
                    
                    // Text(_dateTime==null?'nothing':_dateTime.toString()),
                    //
                    // InkWell(
                    //   onTap: () {
                    //     showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(1900),
                    //         lastDate: DateTime(2222),
                    //     ).then((value){
                    //         setState(() {
                    //           _dateTime = value!;
                    //         });
                    //     });
                    //   },
                    //   child: Container(
                    //     height: 45,
                    //     width: MediaQuery.of(context).size.width,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       color: Color(0xFFF5F7F8),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text('date.toString()',style: const TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w400,
                    //           color: Color(0xFF8E9191),
                    //         ),),
                    //         SvgPicture.asset('assets/icons/Calendar.svg',
                    //           color: Color(0xFF232C2E),),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    BlocBuilder<VisitCubit, VisitState>(
                      builder: (context, state) {
                        if(state is !GetVisitData){
                          return Center(child: CircularProgressIndicator());
                        }
                        var data = (state as GetVisitData).visit;

                        return Container(
                      height: MediaQuery.of(context).size.height,
                       child: data!.allVisited!.isEmpty?Container(
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
                        itemCount: data.allVisited!.length,
                          itemBuilder: (context,index){
                          return ShopListCard(
                            img: data.allVisited![index].photourl,
                            shopname: data.allVisited![index].shopid!.storename,
                            attendenceDate: data.allVisited![index].dateString,
                            time: data.allVisited![index].time,
                          );
                          }
                      ),
                    );
                      },
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

   String convertTime(String? time,int? index){
     List dates = time!.split(':');
     print(dates[1]);
     return dates[index!];
   }

}
