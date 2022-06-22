
import 'package:flutter/material.dart';

import '../../../Constants/Colors/app_colors.dart';


class MaterialTextField extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool readOnly;
  MaterialTextField({required this.hintText,required this.lable,required this.controller,required this.readOnly});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },
        readOnly: readOnly,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText:hintText,
          labelText: lable,
          contentPadding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color:textFieldBorder, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
