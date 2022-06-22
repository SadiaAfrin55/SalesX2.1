
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AdminContactBtn extends StatelessWidget {
  final String? title;
  final SvgPicture? img;
  final VoidCallback? pressed;
  AdminContactBtn({this.title,this.pressed,this.img,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        width:MediaQuery.of(context).size.width*0.5,
        height:48,
        decoration: BoxDecoration(
          color: Color(0xFFE6F2FE),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: img,),
              SizedBox(width: 8),
              Text('$title',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0180F5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
