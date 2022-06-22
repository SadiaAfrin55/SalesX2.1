
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Button/CustomButoon/custom_button.dart';

class AleartDialogue extends StatelessWidget {
  final VoidCallback pressed;
  const AleartDialogue({Key? key,required this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height:150,
              width: 150,
              child: Lottie.asset('assets/lottie/sorry.json',)),
          const SizedBox(height: 10,),
          const Text("Sorry ! You can't, today is your day off",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black
            ),
          ),
          const SizedBox(height: 15,),
          CustomButton(
            title: 'Check Activity',
            onTap: pressed
          ),
        ],
      ),
    );;
  }
}
