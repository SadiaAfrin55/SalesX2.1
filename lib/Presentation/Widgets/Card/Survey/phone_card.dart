
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';

class Phone extends StatelessWidget {
  final String? name;
  final String? phoneNumber;
  const Phone({this.name,this.phoneNumber,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1, color: const Color(0xFFEEEFEF))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$name',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF232C2E)
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      //color: Colors.lime,
                      child: SvgPicture.asset('assets/icons/call.svg')),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: 2,
                  child: Container(
                    //color: Colors.lightBlue,
                    child: Text('$phoneNumber',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF232C2E)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
