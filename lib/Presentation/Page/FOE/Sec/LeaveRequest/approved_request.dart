
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../../Bloc/Leave/leave_cubit.dart';
import 'Components/request_card.dart';
class ApprovedRequest extends StatefulWidget {
  const ApprovedRequest({Key? key, id, name, reason, requestPendingFrom, type, days, from, to, approve}) : super(key: key);

  @override
  _ApprovedRequestState createState() => _ApprovedRequestState();
}

class _ApprovedRequestState extends State<ApprovedRequest> {

  String? linmanagerName;
  String? linemanageId;
  String? token;

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linmanagerName = tokenx.get('linmanagerName');
      linemanageId = tokenx.get('linmanagerid');
      BlocProvider.of<LeaveCubit>(context).loadedApprovedLeave(linemanageId!,"accept","s");
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LeaveCubit,LeaveState>(
      builder: (context,state){
        if(state is !ApprovedLeaveLoded){
          return Center(
            child: Text('not loaded'),
          );
        }
        final data = (state as ApprovedLeaveLoded).leaveResponse;
        Logger().d(data!.leaveform);

        return data.leaveform!.isEmpty?Center(
          child: Column(
            children: [
              Text(("No data found")),
            ],
          ),
        ):

        SizedBox(
          height: MediaQuery.of(context).size.height,
          child:ListView.builder(
              itemCount: data.leaveform!.length,
              itemBuilder: (context,index){
                return RequestCard(
                  name: data.leaveform![index].username,
                  status: data.leaveform![index].leaveformat,
                  reason: data.leaveform![index].reason,
                  fromDate: convertdateIntoDat(data.leaveform![index].createdAt!,0),
                  toDate: convertdateIntoDat(data.leaveform![index].createdAt!,0),
                );
              }
          ),
        );
      },

    );
  }

  String convertdateIntoDat(String date,int index){
    List dates = date.split('To');
    print(dates[0]);
    return dates[index];
  }

}
