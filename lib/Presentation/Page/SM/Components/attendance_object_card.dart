
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttendencelistCard extends StatefulWidget {
  final String? img;
  final String? checkIn;
  final String? checkOut;
  final String? attendenceDate;
  final String? status;
  const AttendencelistCard({
    //this.img,
    this.checkIn,
    this.checkOut,
    this.attendenceDate,
    this.status,
    this.img,
    Key? key}) : super(key: key);

  @override
  State<AttendencelistCard> createState() => _AttendencelistCardState();
}

class _AttendencelistCardState extends State<AttendencelistCard> {

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
              backgroundImage: NetworkImage('${widget.img}'),
              //backgroundImage: AssetImage('assets/icons/profile_user.png'),
            ),
            const SizedBox(width: 20),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Check in',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text('${widget.checkIn}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(height: 6,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calender_icon.svg',
                    ),
                    SizedBox(width: 5),
                    Text('${widget.attendenceDate}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              width: MediaQuery.of(context).size.width*0.1,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Check out',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text('${widget.checkOut}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(height: 6,),
                Row(
                  children: [
                    // SvgPicture.asset(
                    //   'assets/icons/time_icon.svg',
                    //   color: Colors.green,
                    // ),
                    SizedBox(width: 5),
                    Text('${widget.status}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}