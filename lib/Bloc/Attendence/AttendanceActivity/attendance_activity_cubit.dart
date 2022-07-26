import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Data/Model/Attendance/AttendanceActivityModel/objectarr.dart';

import '../../../Data/Model/Attendance/TrainingActivityModel/TrainingActivityAttendance.dart';
import '../../../Repository/Attendence/AttendanceActivity/attendance_activity_repository.dart';

part 'attendance_activity_state.dart';

class AttendanceActivityCubit extends Cubit<AttendanceActivityState> {
  var logger = Logger();
  AttendanceActivityCubit() : super(AttendanceActivityInitial());

  void attendanceActivity(String linemanagerId) {
    AttendanceActivityRepository().attendanceHistory(linemanagerId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(attendanceActivityData(object: value.objectarr))
      }
    });
  }

  void trainingActivity(String userId) {
    AttendanceActivityRepository().trainingHistory(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(trainingActivityData(trainingdata: value.attendance))
      }
    });
  }

}
