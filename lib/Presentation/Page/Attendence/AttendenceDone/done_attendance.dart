
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Presentation/Widgets/Button/CustomButoon/custom_button.dart';

import '../../../../Constants/Strings/app_strings.dart';
class DoneAttendance extends StatefulWidget {
  const DoneAttendance({Key? key}) : super(key: key);

  @override
  _DoneAttendanceState createState() => _DoneAttendanceState();
}

class _DoneAttendanceState extends State<DoneAttendance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Attendance',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
              ),
              toolbarHeight: 60,
              elevation: 0.5,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*0.2,
                            child: SvgPicture.asset('assets/icons/done_attendance.svg')),

                         const Text('Already Done!',style: TextStyle(
                           fontSize: 24,
                           fontWeight: FontWeight.w700,
                           color: Colors.black
                         ),),
                        const SizedBox(height: 12,),
                        const Text('Your today’s attendance already marked',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    child: CustomButton(
                      title: 'I Understand',
                      onTap: (){
                        Navigator.pushNamed(context, BACK_TO_HOME);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
