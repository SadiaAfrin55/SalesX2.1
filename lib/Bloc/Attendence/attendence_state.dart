part of 'attendence_cubit.dart';

@immutable
abstract class AttendenceState {}

class AttendenceInitial extends AttendenceState {}


class HolidayCheck extends AttendenceState{
  final String? holiday;
  HolidayCheck({this.holiday});
}

class MarkMorningAttendance extends AttendenceState{
  final bool? attendance;
  MarkMorningAttendance({this.attendance});
}
class MarkLateMorningAttendance extends AttendenceState{
  final String? attendance;
  MarkLateMorningAttendance({this.attendance});
}

class MarkEveningAttendances extends AttendenceState{
  final bool? attendance;
  MarkEveningAttendances({this.attendance});
}



class CheckMoringLateAttendance extends AttendenceState{
  final String? status;
  CheckMoringLateAttendance({this.status});
}

class CheckUserAttendance extends AttendenceState{
  final String? attendance;
  CheckUserAttendance({this.attendance});
}

class CheckUserEveningAttendance extends AttendenceState{
  final String? attendance;
  CheckUserEveningAttendance({this.attendance});
}



class GetUserAttendance extends AttendenceState{
  final List<Attendance>? attendance;

  GetUserAttendance({this.attendance});
}

class GetUserAttendanceByMonth extends AttendenceState{
  final List<Attendance>? attendance;

  GetUserAttendanceByMonth({this.attendance});
}

class GetSecAttendance extends AttendenceState{
  final List<AttendanceTwo>? attendance;

  GetSecAttendance({this.attendance});
}

class StoreHolidayCheck extends AttendenceState{
  final String? holiday;

  StoreHolidayCheck({this.holiday});

}
