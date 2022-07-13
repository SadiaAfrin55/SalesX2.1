
import 'package:flutter/material.dart';


class NumberTextField extends StatelessWidget {

  final String hintText;
  final bool readOnly;
  NumberTextField({required this.controller, required this.hintText,required this.readOnly});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {
        if (value!.length <= 0)
          return 'Enter valid number';
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0,),
          borderSide: BorderSide(color: Colors.transparent,),
        ),

        filled: true,
        fillColor: Color(0xFFF5F7F8),
      ),
    );
  }
}
