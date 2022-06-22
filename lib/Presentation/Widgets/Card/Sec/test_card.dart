
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
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 33,
              backgroundColor: Color(0xFFFAD6D6),
              backgroundImage: AssetImage('assets/images/user.png'),

            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dipta Nathrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000)
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.1,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAD6D6),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Center(child: Text('${widget.status}',style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFEB5757),
                      ),)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('From Date',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF232C2E)
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text('${widget.fromDate}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0180F5)
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 28),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('To Date',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF232C2E)
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text('${widget.toDate}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0180F5)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}