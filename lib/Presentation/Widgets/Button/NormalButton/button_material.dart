import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function() tap;

  const NormalButton({Key? key, required this.text, this.color=Colors.blueAccent, required this.tap, this.textColor=Colors.white}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color
        ),
        child: Center(child: Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 20),)),
      ),
    );
  }
}
