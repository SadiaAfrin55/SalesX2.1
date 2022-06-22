import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/DayoffAttendance/dayoff_attendance_cubit.dart';

class CheckDayoffAttendance extends StatefulWidget {
  const CheckDayoffAttendance({Key? key}) : super(key: key);

  @override
  _CheckDayoffAttendanceState createState() => _CheckDayoffAttendanceState();
}

class _CheckDayoffAttendanceState extends State<CheckDayoffAttendance> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayoffAttendanceCubit, DayoffAttendanceState>(
      builder: (context, state) {
        if(state is CheckUserDayoffAtendance){
          final attn = state.attendance;
          return Container(
            child: Center(
              child: Text(attn.toString()),
            ),
          );
        }else{
          return Center(
            child: Icon(Icons.close),
          );
        }


      },
    );
  }
}
