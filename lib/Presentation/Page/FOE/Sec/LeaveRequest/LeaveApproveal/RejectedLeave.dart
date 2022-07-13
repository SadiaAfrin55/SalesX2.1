import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../../../Bloc/Leave/leave_cubit.dart';
import '../Components/leave_card.dart';


class RejectedLeave extends StatefulWidget {
  @override
  _RejectedLeaveState createState() => _RejectedLeaveState();
}

class _RejectedLeaveState extends State<RejectedLeave> {

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String? linmanagerName;
  String? linemanageId;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linmanagerName = tokenx.get('linmanagerName');
      linemanageId = tokenx.get('linmanagerid');
      //BlocProvider.of<LeaveCubit>(context).loadedRejectLeave("615ae6e526547e00086986f3","reject","s");
      BlocProvider.of<LeaveCubit>(context).loadedRejectLeave(linemanageId!,"reject","s");
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<LeaveCubit,LeaveState>(
      builder: (context,state){
        if(!(state is RejectedLeaveLoded)){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final leave = (state as RejectedLeaveLoded).leaveResponse;
        Logger().d(leave!.leaveform);
        return leave.leaveform==null?Center(
          child: Container(
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
          ),
        ):

        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
              physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: leave.leaveform!.map((leave) =>
                  Container(
                    margin: EdgeInsets.only(bottom: 14),
                    child: LeaveCardForApproval(
                      name: leave.username,
                      reason: leave.reason,
                      requestPendingFrom: "Pending from: $linmanagerName",
                      type: leave.leaveformat,
                      days: calculatedaymain(calculatedays(convertdateIntoDat(leave.date.toString(),0),0),calculatedays(convertdateIntoDat(leave.date.toString(),1),0)),
                      from: convertdateIntoDat(leave.date.toString(),0),
                      to: convertdateIntoDat(leave.date.toString(),1),
                      approve: false,
                    ),
                  )

              ).toList()
          ),
        );
      },

    );
  }


  //calculate days from data range
  String convertdateIntoDat(String date,int index){
    List dates = date.split('To');
    print(dates[0]);
    return dates[index];
  }
  String calculatedays(String date,int index){
    List dates = date.split('/');
    return dates[index];
  }
  int calculatedaymain(String date,String date2){
    int x=int.parse(date);
    int y=int.parse(date2);
    int math;
    if(x<y){
      math=y-x;
    }else{
      math=x-y;
    }
    print(math);
    return math;
  }
  //calculate days from data range



  Future<Null>refreshList() async{
    refreshKey.currentState?.show(atTop: false);
    setState(() {

    });
    return null;
  }
}
