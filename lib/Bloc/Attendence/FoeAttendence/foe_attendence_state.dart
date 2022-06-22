part of 'foe_attendence_cubit.dart';

@immutable
abstract class FoeAttendenceState {}

class FoeAttendenceInitial extends FoeAttendenceState {}


class GiveFoeAttendance extends FoeAttendenceState{
  final bool? status;
  GiveFoeAttendance({this.status});
}

class GiveFoeSignOffAttendance extends FoeAttendenceState{
  final bool? status;
  GiveFoeSignOffAttendance({this.status});
}

class GetFoeAttendance extends FoeAttendenceState{

  final List<FoeAttendances>? foeAttendancess;
  GetFoeAttendance({this.foeAttendancess});
}

class GetFoeAttendanceByDate extends FoeAttendenceState{

  final FoeAttendanceByDateResponse? foeAttendanceByDateResponse;
  GetFoeAttendanceByDate({this.foeAttendanceByDateResponse});
}

class CheckFoeSignOffAtendance extends FoeAttendenceState{
  final String? attendance;
  CheckFoeSignOffAtendance({this.attendance});
}

class GetSecAttendance extends FoeAttendenceState{
  final int? total;
  final int? present;
  final int? absent;
  GetSecAttendance({this.total, this.present, this.absent});
}