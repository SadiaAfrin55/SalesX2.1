
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopListCard extends StatefulWidget {
  final String? img;
  final String? shopname;
  final String? attendenceDate;
  final String? time;
  const ShopListCard({
    //this.img,
    this.shopname,
    this.attendenceDate,
    this.time,
    this.img,
    Key? key}) : super(key: key);

  @override
  State<ShopListCard> createState() => _ShopListCardState();
}

class _ShopListCardState extends State<ShopListCard> {

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('Shop: '+'${widget.shopname}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/calender_icon.svg',
                            ),
                            SizedBox(width: 5),
                            Text('${widget.attendenceDate}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/time_icon.svg',
                              color: Colors.red,
                            ),
                            SizedBox(width: 5),
                            Text('${widget.time}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 28),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

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