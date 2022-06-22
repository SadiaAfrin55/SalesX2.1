
import 'package:json_annotation/json_annotation.dart';


import 'Attendance.dart';


part 'AttendanceResponse.g.dart';

@JsonSerializable()
class AttendanceResponse{

  bool? success;
  List<Attendance>? attendance;


  AttendanceResponse(this.success, this.attendance);

  factory AttendanceResponse.fromJson(Map<String,dynamic>json)=>
      _$AttendanceResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AttendanceResponseToJson(this);
}