
import 'package:flutter/material.dart';

import '../../../../Constants/Colors/app_colors.dart';
class LeaveListCard extends StatefulWidget {
  final String? leaveType;
  final String? status;
  final String? createdDate;
  final String? fromDate;
  final String? toDate;
  final String? leaveReason;
  const LeaveListCard({
    this.leaveType,
    this.status,
    this.createdDate,
    this.fromDate,
    this.toDate,
    this.leaveReason,
    Key? key}) : super(key: key);

  @override
  State<LeaveListCard> createState() => _LeaveListCardState();
}

class _LeaveListCardState extends State<LeaveListCard> {

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color:Color(0xFFEEEFEF),width: 1)
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text('Apply Date',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF232C2E),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('${widget.createdDate}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0180F5),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    Text('Status',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF232C2E),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text('${widget.status}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF08BC85),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                child: const Divider(thickness: 1,color: dividerColor,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Type',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8E9191),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('${widget.leaveType}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF232C2E),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('From date',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8E9191),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('${widget.fromDate}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF232C2E),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('To date',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8E9191),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('${widget.toDate}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF232C2E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                child: const Divider(thickness: 1,color: dividerColor,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Reason',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF232C2E),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,
                  child: Text('${widget.leaveReason}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF232C2E),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
