
import 'package:flutter/material.dart';

import '../../../Constants/Colors/app_colors.dart';

class OnChangeTextField extends StatelessWidget {
  final String hintText;
  final bool readOnly;
  final bool big;
  final Function(String)? tap;
  OnChangeTextField({Key? key,required this.controller, required this.hintText,required this.readOnly, required this.tap, this.big=false}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },
        //keyboardType: TextInputType.numberWithOptions(decimal: true),
        keyboardType: TextInputType.name,
        onChanged: tap,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          filled: true,
          fillColor: const Color(0xFFF5F7F8),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0,),
            borderSide: BorderSide(color: Colors.transparent,),
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide:
          //   BorderSide(color:Colors.black12, width: 1.0),
          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide:
          //   BorderSide(color:big?Colors.redAccent: Colors.lightBlueAccent, width: 2.0),
          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // ),
        ),
      ),
    );
  }
}
