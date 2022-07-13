
import 'package:flutter/material.dart';
class RequestCard extends StatelessWidget {
  String? name;
  String? fromDate;
  String? toDate;
  String? status;
  String? reason;
   RequestCard({
    this.name,
    this.fromDate,
    this.toDate,
    this.status,
    this.reason,
    Key? key}) : super(key: key);

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
              CircleAvatar(backgroundImage: AssetImage('assets/images/secimg.png'),radius: 35,),
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
                           Text('$name',style: TextStyle(
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
                                   Text('$fromDate',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.lightBlue),),
                                 ],
                               ),
                               SizedBox(width: 16,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('To Date',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                   const SizedBox(height: 4,),
                                   Text('$toDate',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.lightBlue),),
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     Expanded(
                       child: Container(
                         height: 26,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(27),
                           color: const Color(0xFFFAD6D6)
                         ),
                         child: Center(
                           child: Text('$status',style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w400,
                             color: const Color(0xFFEB5757)
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
                Text('$reason',style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
