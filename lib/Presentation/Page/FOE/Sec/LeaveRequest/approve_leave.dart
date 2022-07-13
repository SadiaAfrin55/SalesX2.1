import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Presentation/main_screen.dart';

import '../../../../../Bloc/Leave/leave_cubit.dart';
import '../../../../Screens/SplashScreen/splash_screen.dart';

class ApproveLeaverequest extends StatefulWidget {

  final String? name;
  final String? requestPendingFrom;
  final String? from;
  final String? to;
  final String? type;
  final String? reason;
  final String? id;
  final int? days;
  final bool? approve;

  const ApproveLeaverequest({required Key key,this.name, this.requestPendingFrom, this.from, this.to, this.type, this.reason, this.days, this.approve, this.id}) : super(key: key);
  @override
  _ApproveLeaverequestState createState() => _ApproveLeaverequestState();
}

class _ApproveLeaverequestState extends State<ApproveLeaverequest> {
  bool circular=false;
  void initState() {
    BlocProvider.of<LeaveCubit>(context).getLeaveTotal(widget.id!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final  _random = Random();
    Color color=Colors.primaries[_random.nextInt(Colors.primaries.length)];
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Approve Leave request"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child:Material(
          shadowColor: color,
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color:color,
                  width: 0.4
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                      color: color,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child:CircleAvatar(
                                  minRadius: 40,
                                  backgroundColor: Colors.blue.shade800,
                                  child: const Text('SEC'),
                                )
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name: ${widget.name}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 14),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("From: ${widget.from}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 14),),
                                        Text("To: ${widget.to}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 14),),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade400,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text("Type: ${widget.type}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),)),
                                        Text("Day(S): ${widget.days}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 14),),
                                      ],
                                    ),

                                    Text("Reason:  ${widget.reason}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                                    BlocBuilder<LeaveCubit, LeaveState>(
                                      builder: (context, state) {
                                        if(state is !GetTotalLeave){
                                          return Center(child: CircularProgressIndicator(),);
                                        }
                                        final data=(state as GetTotalLeave).totalLeave;
                                        return Container(
                                          padding: EdgeInsets.all(8),
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Total casualleave: "+data!.casualleave.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                              SizedBox(height: 10,),
                                              Text("Total sickleave: "+data.sickleave.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        widget.approve!?SizedBox(height: 16,):Container(),
                        widget.approve!? Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: InkWell(
                                  onTap: (){
                                    BlocProvider.of<LeaveCubit>(context).updateLeaveStatus(widget.id!,"accept");
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.greenAccent.shade400,
                                          blurRadius: 10,
                                          offset: Offset(0, 3), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: BlocListener<LeaveCubit, LeaveState>(
                                      listener: (context, state) {
                                        if(state is UpdateStatus){
                                          // ignore: unnecessary_statements
                                          final leave=(state as UpdateStatus).response;
                                          Logger().d(leave);
                                          setState(() {
                                            circular = false;
                                          });
                                          Navigator.pushReplacement(context, PageTransition(MainScreen()));
                                        }
                                      },
                                      child:circular? Center(child: CircularProgressIndicator(),) :Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Approve",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),
                                          Icon(Icons.login,color: Colors.white,size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                )),


                          ],
                        ):Container()

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
