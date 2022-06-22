import 'package:flutter/material.dart';

class MaterialBackgroundTextField extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool readOnly;
  final bool isNumber;
  MaterialBackgroundTextField({required this.lable,required this.controller, required this.hintText,required this.readOnly, required this.isNumber});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {
        Pattern pattern =
            r'^[0-9]';
        RegExp regex = RegExp(pattern.toString());

        if (value == null || value.isEmpty) {
          return 'Please fillup';
        }
        else if(value.length <= 0){
          return 'Enter valid number';
        }
        else if(!regex.hasMatch(value)){
          return 'Enter integer number';
        }else{
          return null;
        }

      },
      keyboardType: isNumber?TextInputType.number:TextInputType.text,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        labelText: lable,
        fillColor: Color(0xFFF5F7F8),
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color:Colors.white, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
