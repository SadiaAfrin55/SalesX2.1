part of 'attendance_activity_cubit.dart';

@immutable
abstract class AttendanceActivityState {}

class AttendanceActivityInitial extends AttendanceActivityState {}

class attendanceActivityData extends AttendanceActivityState{
  final List<attendanceObject>? object;

  attendanceActivityData({this.object});
}

class trainingActivityData extends AttendanceActivityState{
  final List<TrainingActivityAttendance>? trainingdata;

  trainingActivityData({this.trainingdata});
}
