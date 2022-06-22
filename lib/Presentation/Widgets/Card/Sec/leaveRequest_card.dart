
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Presentation/Widgets/TextFields/textarea_textdield.dart';

class LeaveRequestCard extends StatefulWidget {
  //final Image? img;
  final String? fromDate;
  final String? toDate;
  final String? status;
  const LeaveRequestCard({
    //this.img,
    this.fromDate,
    this.toDate,
    this.status,
    Key? key}) : super(key: key);

  @override
  State<LeaveRequestCard> createState() => _LeaveRequestCardState();
}

class _LeaveRequestCardState extends State<LeaveRequestCard> {

  String? day;
  String? month;
  String? year;
  String? formatDate;

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    day=dateParse.day.toString();
    month=dateParse.month.toString();
    year=dateParse.year.toString();

    var formattedDate = "$day-$month-$year";
    formatDate = formattedDate.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFFEEEFEF),width: 1)
      ),
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [

          ],
        ),
      ),
    );
  }
}