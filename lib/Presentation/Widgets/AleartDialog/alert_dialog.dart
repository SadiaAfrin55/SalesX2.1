
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              height:140,
              width: 140,
              child: SvgPicture.asset('assets/icons/daypopup.svg')
              //Lottie.asset('assets/lottie/sorry.json',)
            ),
          const SizedBox(height: 15,),
          const Text("You can’t create any sales\nor survey today. It’s your dayclose",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
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
