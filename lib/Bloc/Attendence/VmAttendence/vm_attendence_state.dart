part of 'vm_attendence_cubit.dart';

@immutable
abstract class VmAttendenceState {}

class VmAttendenceInitial extends VmAttendenceState {}

class GiveVmAttendance extends VmAttendenceState{
  final bool? status;

  GiveVmAttendance({this.status});
}

class GiveVmSignOffAttendance extends VmAttendenceState{
  final bool? status;

  GiveVmSignOffAttendance({this.status});
}

class GetVmAttendance extends VmAttendenceState{

  final List<VmAttendances>? vmAttendancess;

  GetVmAttendance({this.vmAttendancess});
}

class GetVmAttendanceByDate extends VmAttendenceState{
  VmAttendanceResponse? vmAttendanceResponse;
  //List<VmAttendances>? attendance;
  GetVmAttendanceByDate({this.vmAttendanceResponse});
}

class CheckVmSignOffAtendance extends VmAttendenceState{
  final String attendance;
  CheckVmSignOffAtendance({required this.attendance});
}

class CheckReSignOffAtendance extends VmAttendenceState{
  final String attendance;
  CheckReSignOffAtendance({required this.attendance});
}

class CheckVmAtendance extends VmAttendenceState{
  final String? attendance;
  CheckVmAtendance({this.attendance});
}
class CheckReAtendance extends VmAttendenceState{
  final String? attendance;
  CheckReAtendance({this.attendance});
}
