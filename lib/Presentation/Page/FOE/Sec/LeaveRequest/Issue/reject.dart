import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/Leave/leave_cubit.dart';

import '../../../../../Widgets/Card/Leave/leave_card.dart';
import '../Components/request_card.dart';

class RejectRequest extends StatefulWidget {
  final String? id;

  const RejectRequest({this.id, Key? key}) : super(key: key);

  @override
  _RejectRequestState createState() => _RejectRequestState();
}

class _RejectRequestState extends State<RejectRequest> {
  @override
  void initState() {
    BlocProvider.of<LeaveCubit>(context).loadedPendingLeave(
        widget.id!, "reject");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<LeaveCubit, LeaveState>(
          builder: (context, state) {
            if(state is !LeaveLoded){
              return const Center(child: CircularProgressIndicator(),);
            }
            var data = (state as LeaveLoded).leaveResponse;

            log('ui $data');
            return Column(
              children: [
                data!.leaveform!.isEmpty?
                Container(
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
                ):
                SizedBox(
                  child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: data.leaveform!.map((e) =>
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            child: LeaveListCard(
                              leaveType: e.leaveformat,
                              status: e.acceptence,
                              createdDate: createdateIntoDat(e.createdAt,0),
                              fromDate: convertdateIntoDat(e.date.toString(), 0),
                              toDate: convertdateIntoDat(e.date.toString(), 1),
                              leaveReason: e.reason,
                            ),
                          )
                      ).toList()
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }

  String convertdateIntoDat(String date,int index){
    List dates = date.split('To');
    print(dates[0]);
    return dates[index];
  }
  String createdateIntoDat(String? date,int? index){
    List dates = date!.split("T");
    print(dates[0]);
    return dates[index!];
  }
}
