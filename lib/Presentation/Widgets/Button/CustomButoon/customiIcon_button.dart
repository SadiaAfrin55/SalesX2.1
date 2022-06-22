
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomIconButton extends StatelessWidget {
  final String? title;
  final VoidCallback? pressed;
  CustomIconButton({this.title,this.pressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        width:MediaQuery.of(context).size.width,
        height:55,
        decoration: BoxDecoration(
          color: Color(0xFF0180F5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_outlined,color: Colors.white,),
              SizedBox(width: 10),
              Text('$title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
