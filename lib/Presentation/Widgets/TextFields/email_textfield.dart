
import 'package:flutter/material.dart';


class emailTextField extends StatelessWidget {

  final String hintText;
  final bool readOnly;
  emailTextField({required this.controller, required this.hintText,required this.readOnly});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = RegExp(pattern.toString());
        if (value == null || value.isEmpty) {
          return 'Please fillup';
        }
        else if (!regex.hasMatch(value)){
          return 'Enter Valid Email';
        }else{
          return null;
        }
      },

      readOnly: readOnly,
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
