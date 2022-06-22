
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class FilledIconField extends StatefulWidget {
  final String? title;
  final String? headertitle;
  final TextEditingController controller;
  const FilledIconField({  this.title,required this.controller,
    this.headertitle,Key? key, }) : super(key: key);

  @override
  _FilledIconFieldState createState() => _FilledIconFieldState();
}

class _FilledIconFieldState extends State<FilledIconField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.headertitle!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.grey.shade300.withOpacity(0.4),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding:EdgeInsets.symmetric(horizontal:10, vertical:10),
                hintText: widget.title!,
                  border: InputBorder.none,
                suffixIcon:Icon(Icons.calendar_today_outlined,color: Colors.black.withOpacity(0.5),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
