import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../../../Bloc/Leave/leave_cubit.dart';
import '../Components/leave_card.dart';


class ApprovedLeave extends StatefulWidget {
  final String? id;

  const ApprovedLeave({Key? key, this.id}) : super(key: key);
  @override
  _ApprovedLeaveState createState() => _ApprovedLeaveState();
}

class _ApprovedLeaveState extends State<ApprovedLeave> {

  String? linmanagerName;
  String? linemanageId;
  String? token;
  String? role;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linmanagerName = tokenx.get('linmanagerName');
      linemanageId = tokenx.get('userId');
      token = tokenx.get('token');
      role = tokenx.get('role');

      //BlocProvider.of<LeaveCubit>(context).loadedApprovedLeave("615ae6e526547e00086986f3","accept",token!);
      BlocProvider.of<LeaveCubit>(context).loadedApprovedLeave(linemanageId!,"accept",token!);
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
        if(state is !ApprovedLeaveLoded){
          return Center(
            child: Text('no data ')
          );
        }
        var leave = (state as ApprovedLeaveLoded).leaveResponse;
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
                      days: calculatedaymain(calculatedays(convertdateIntoDat(leave.date.toString(),0),0),
                          calculatedays(convertdateIntoDat(leave.date.toString(),1),0)),
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

}
