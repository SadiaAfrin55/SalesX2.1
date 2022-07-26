
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final SvgPicture? cardImage;
  const ProfileCard({this.title,this.subtitle,this.cardImage,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFEEEFEF),width: 1),
      ),
      width: 108,
      height: 112,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: cardImage,),
          SizedBox(height: 14),
          Text('$title',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope'
          ),),
          SizedBox(height: 2),
          Text('$subtitle',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Manrope',
            ),),
        ],
      ),
    );
  }
}
