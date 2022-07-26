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

  final List<vmAttendance> vmAttendancess;
  GetVmAttendance({required this.vmAttendancess});
}

class GetVmAttendanceByDate extends VmAttendenceState{
  vmAttendanceResponse? vmAtdResponse;
  GetVmAttendanceByDate({required this.vmAtdResponse});
}

class getProfiledata extends VmAttendenceState{
  Profile? profile;
  getProfiledata({required this.profile});
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
