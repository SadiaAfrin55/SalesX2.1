
import 'package:flutter/material.dart';


class InventoryTextfield extends StatelessWidget {

  final String hintText;
  final bool readOnly;
  InventoryTextfield({required this.controller, required this.hintText,required this.readOnly});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },

        readOnly: readOnly,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          contentPadding:
          EdgeInsets.symmetric(vertical: 11.0,horizontal: 13),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFF5F7F8),
        ),
      ),
    );
  }
}
