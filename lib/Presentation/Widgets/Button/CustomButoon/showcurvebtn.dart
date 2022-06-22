
import 'package:flutter/material.dart';

class ShadowCarveButton extends StatelessWidget {
  final VoidCallback? pressed;
  final double? width;
  final String? btnText;
  final Color? color;

  const ShadowCarveButton({Key?key, this.pressed, this.width, this.btnText, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(40),
                shadowColor:color?? Colors.blue,
                child: Container(
                  width: width??300,
                  color:color?? Theme.of(context).primaryColor,
                  child: Center(child:Text(btnText??"Submit",style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
            ),
          )
      ),
    );
  }
}
