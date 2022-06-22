import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? tap;

  const BorderButton({Key? key, required this.text, this.color=Colors.blueAccent, required this.tap, this.textColor=Colors.blueAccent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(
            color: color,
          ),
        ),
        child: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_giftcard_rounded,color: color,size: 20,),
                Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 20),)
              ],
            )
        ),
      ),
    );
  }
}
