import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Repository/Attendence/attendence_repository.dart';

part 'dayoff_attendance_state.dart';

class DayoffAttendanceCubit extends Cubit<DayoffAttendanceState> {

  var logger = Logger();
  DayoffAttendanceCubit() : super(DayoffAttendanceInitial());

  void giveDayoffAttendance(File iamge, String storeId, String businessUnit, String useId, String userAddress) {
    AttendanceRepository().giveDayoffAttendance(iamge,storeId,businessUnit,useId,userAddress).then((data) => {
      //logger.d(data),
      if(data!=null){
        emit(MarkDayoffAttendance(attendance: data['success']))
      }
    });
  }

  void chekUserDayoffAttendance(String userId) {
    logger.d("api call");
    AttendanceRepository().chekUserDayoffAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(CheckUserDayoffAtendance(attendance: value['attendance']))
      }
    });
  }
}
