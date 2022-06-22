
import 'package:json_annotation/json_annotation.dart';

import 'VmAttendance/AttendanceTwo.dart';

part 'AttendanceResponseTwo.g.dart';

@JsonSerializable()
class AttendanceResponseTwo{

  bool? success;
  List<AttendanceTwo>? attendance;


  AttendanceResponseTwo(this.success, this.attendance);

  factory AttendanceResponseTwo.fromJson(Map<String,dynamic>json)=>
      _$AttendanceResponseTwoFromJson(json);
  Map<String,dynamic>toJson()=>_$AttendanceResponseTwoToJson(this);
}