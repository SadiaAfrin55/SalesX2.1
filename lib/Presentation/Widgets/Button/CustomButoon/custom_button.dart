
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  CustomButton({ this.title,this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:MediaQuery.of(context).size.width,
        height:54,
        decoration: BoxDecoration(
          color: Color(0xFF0180F5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text('$title',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
