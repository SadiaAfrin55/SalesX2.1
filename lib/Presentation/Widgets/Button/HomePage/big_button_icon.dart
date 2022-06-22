import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigButtonIcon extends StatelessWidget {
  final String? text;
  final String? image;
  final Color color;
  final Function()? tap;
  const BigButtonIcon({Key? key, this.text, required this.color, this.tap, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 86,
        decoration: BoxDecoration(
            color: color,
                borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(image!,height: 32,),
            SizedBox(height: 10,),
            Text(text!,style: TextStyle(fontSize:15,fontWeight: FontWeight.w500 ),),
          ],
        ),
      ),
    );
  }
}
