

import 'package:json_annotation/json_annotation.dart';




part 'VmWorkingHourAttendance.g.dart';

@JsonSerializable()
class VmWorkingHourAttendance {

  String? photo;
  String? intime;
  String? outtime;
  String? userId;
  String? workingtime;


  VmWorkingHourAttendance(
      this.photo, this.intime, this.outtime, this.userId, this.workingtime);

  factory VmWorkingHourAttendance.fromJson(Map<String,dynamic>json)=>
      _$VmWorkingHourAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$VmWorkingHourAttendanceToJson(this);

}