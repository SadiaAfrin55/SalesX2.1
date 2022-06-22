
import 'package:flutter/material.dart';


class PhonenumberTextField extends StatelessWidget {

  final String hintText;
  final bool readOnly;
  PhonenumberTextField({required this.controller, required this.hintText,required this.readOnly});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {
        if (value!.length != 11)
          return 'Mobile Number must be of 11 digit';
        else
          return null;
      },

      readOnly: readOnly,
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14),
        contentPadding:
        EdgeInsets.symmetric(vertical: 11.0,horizontal: 12),
        border: InputBorder.none,
        filled: true,
        fillColor: Color(0xFFF5F7F8),
      ),
    );
  }
}
