
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Bloc/Leave/leave_cubit.dart';
import 'package:salesx_new_project/Presentation/main_screen.dart';

import '../../../../../Screens/SplashScreen/splash_screen.dart';
class RequestCard extends StatefulWidget {
  String? img;
  String? name;
  String? fromDate;
  String? toDate;
  String? status;
  String? reason;
  String? id;
  bool? approve;
   RequestCard({
    this.img,
    this.name,
    this.fromDate,
    this.toDate,
    this.status,
    this.reason,
    this.id,
    this.approve,
    Key? key}) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {

  bool circular=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEEEFEF))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFFAD6D6),
                child: Text('${widget.img}',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink
                ),
                ),
              ),
               SizedBox(width: 16,),
               Expanded(
                 child: Row(
                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Expanded(
                       flex: 4,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('${widget.name}',style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                             color: Colors.black
                           ),),
                           const SizedBox(height: 6,),
                           Row(
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('From Date',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                   const SizedBox(height: 4,),
                                   Text('${widget.fromDate}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.lightBlue),),
                                 ],
                               ),
                               SizedBox(width: 16,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('To Date',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                   const SizedBox(height: 4,),
                                   Text('${widget.toDate}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.lightBlue),),
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     Container(
                        height: 26,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(27),
                         color: const Color(0xFFFAD6D6)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                         child: Center(
                           child: Text('${widget.status}',
                             textAlign: TextAlign.center,
                             style: const TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w400,
                             color: Color(0xFFEB5757)
                           ),),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reason',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue
                ),),
                Text('${widget.reason}',style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/90,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  print("this is leave id no : " + widget.id!);
                  setState(() {
                    circular=true;
                  });
                  BlocProvider.of<LeaveCubit>(context).updateLeaveStatus(widget.id!,"reject");
                },
                child: Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEFE0),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child:  BlocListener<LeaveCubit, LeaveState>(
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
                    child: circular?CircularProgressIndicator():const Center(
                    child: Text('Reject',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF8919),
                    ),),
                  ),
                 ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/30,),
              InkWell(
                onTap: (){
                  print("this is leave id no : " + widget.id!);
                  setState(() {
                    circular=true;
                  });
                  BlocProvider.of<LeaveCubit>(context).updateLeaveStatus(widget.id!,"accept");
                },
                child: Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                  decoration: BoxDecoration(
                      color: const Color(0xFF0180F5),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child:  BlocListener<LeaveCubit, LeaveState>(
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
                  child: circular?const CircularProgressIndicator():Center(
                    child: Text('Approve',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),),
                  ),
                ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
