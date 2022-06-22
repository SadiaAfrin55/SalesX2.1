
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class NotificationCard extends StatelessWidget {
  final String title;
  final String date;
  const NotificationCard({
    required this.title,
    required this.date,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/bell.svg'),
          const SizedBox(width: 15,),
          Expanded(
            flex:2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title',style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/clock.svg',color: Color(0xFF8E9191)),
                        const SizedBox(width: 5),
                        Text('$date',style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8E9191)
                        ),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
