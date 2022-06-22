

import 'package:json_annotation/json_annotation.dart';




part 'FoeWorkingHourAttendance.g.dart';

@JsonSerializable()
class FoeWorkingHourAttendance {

  String? photo;
  String? intime;
  String? outtime;
  String? userId;
  String? workingtime;


  FoeWorkingHourAttendance(
      this.photo, this.intime, this.outtime, this.userId, this.workingtime);

  factory FoeWorkingHourAttendance.fromJson(Map<String,dynamic>json)=>
      _$FoeWorkingHourAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$FoeWorkingHourAttendanceToJson(this);

}