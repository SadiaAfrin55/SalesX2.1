
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TargetCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Image? cardImage;
  const TargetCard({this.title,this.subtitle,this.cardImage,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFEEEFEF),width: 1),
      ),
      width: MediaQuery.of(context).size.width*0.4,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              child: Center(child: cardImage,)),
          const SizedBox(height: 8),
          Text('$title',style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope'
          ),),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('See Details',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0180F5),
                  fontFamily: 'Manrope',
                ),),
              const SizedBox(width: 2,),
              SvgPicture.asset('assets/icons/double-arrow.svg'),

            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
