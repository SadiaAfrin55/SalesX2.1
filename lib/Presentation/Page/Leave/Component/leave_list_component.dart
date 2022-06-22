
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/Leave/leave_card.dart';
class LeaveListComponents extends StatefulWidget {
  final String? date;
  const LeaveListComponents({Key? key,this.date,}) : super(key: key);

  @override
  _LeaveListComponentsState createState() => _LeaveListComponentsState();
}

class _LeaveListComponentsState extends State<LeaveListComponents> {
  String? userId;
  String? leaveDate;
  String? saveMonth;
  String? showDateInfo;
  String? month;
  DateTime? selectedDate;
  String? token;
  String? role;
  DateTime initialDate=DateTime.now();
  var dateParse;
  int? tabPosition=0;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      role = tokenx.get('role');
      //BlocProvider.of<LeaveCubit>(context).loadedLeaveByMonth(userId!,formattedmonth!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();
    dateParse = DateTime.parse(date);

    if(dateParse.month.toString().length<2){
      month="0"+dateParse.month.toString();
    }else{
      // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
      month=dateParse.month.toString();
    }

    var formattedDate = "$month-${dateParse.year}";
    var formattedmonth = "$month";
    print(month);
    print("xxxxxxxxx");
    saveMonth=formattedmonth.toString();
    leaveDate=formattedDate.toString();
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeaveCubit, LeaveState>(
      listener: (context, state) {
        // if(state is GetLeaveByMonth){
        //   setState(() {
        //
        //   });
        // }
      },
  child: BlocBuilder<LeaveCubit, LeaveState>(
      builder: (context, state) {

        log('555 $state');

        // final data = (state as GetLeaveByMonth).monthlyleaveResponse;
        //Logger().d(data!.leaveform![0].leaveformat);


        if (state is LeaveLoded) {

          final data = state.leaveResponse;
          return Column(
            children: [
              data.leaveform!.isEmpty?Container(
                height: MediaQuery.of(context).size.height*0.5,
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
              ):SizedBox(
                //height: MediaQuery.of(context).size.height,
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: data.leaveform!.map((leave) =>
                        Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          child: LeaveListCard(
                            leaveType: leave.leaveformat,
                            status: leave.acceptence,
                            createdDate: createdateIntoDat(leave.createdAt,0),
                            fromDate: convertdateIntoDat(leave.date,0),
                            toDate: convertdateIntoDat(leave.date,1),
                            leaveReason: leave.reason,
                          ),
                        )
                    ).toList()
                ),
              )
            ],
          );

        }

        if (state is LeaveError) {
          return Center(child: Text(state.message),);
        }

          return const Center(
            child: CircularProgressIndicator(),
          );

          },
        ),
        );
  }
  String convertdateIntoDat(String? date,int? index){
    List dates = date!.split('To');
    print(dates[1]);
    return dates[index!];
  }
  String calculatedays(String? date,int? index){
    List dates = date!.split('/');
    return dates[index!];
  }
  String createdateIntoDat(String? date,int? index){
    List dates = date!.split("T");
    print(dates[0]);
    return dates[index!];
  }

}
