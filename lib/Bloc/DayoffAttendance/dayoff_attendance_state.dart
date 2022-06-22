part of 'dayoff_attendance_cubit.dart';

@immutable
abstract class DayoffAttendanceState {}

class DayoffAttendanceInitial extends DayoffAttendanceState {}

class CheckUserDayoffAtendance extends DayoffAttendanceState{
  final String attendance;
  CheckUserDayoffAtendance({required this.attendance});
}

class MarkDayoffAttendance extends DayoffAttendanceState{
  final bool? attendance;
  MarkDayoffAttendance({this.attendance});
}
