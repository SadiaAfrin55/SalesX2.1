import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/Leave/leave_cubit.dart';

import '../Components/request_card.dart';

class PendingRequest extends StatefulWidget {
  final String? id;

  const PendingRequest({this.id, Key? key}) : super(key: key);

  @override
  _PendingRequestState createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  @override
  void initState() {
    BlocProvider.of<LeaveCubit>(context).loadedPendingLeave(
        widget.id!, "pending");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.id!.toString()),
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
                          child: RequestCard(
                            name: e.username,
                            status: e.leaveformat,
                            reason: e.reason,
                            fromDate: convertdateIntoDat(e.date.toString(), 0),
                            toDate: convertdateIntoDat(e.date.toString(), 1),
                            id: e.id,
                            approve: true,
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
}
