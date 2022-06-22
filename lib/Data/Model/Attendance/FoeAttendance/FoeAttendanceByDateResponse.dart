// ignore: file_names
import 'package:json_annotation/json_annotation.dart';

import 'FoeAttendances.dart';





part 'FoeAttendanceByDateResponse.g.dart';

@JsonSerializable()
class FoeAttendanceByDateResponse {

  bool? success;
  FoeAttendances? attendance;


FoeAttendanceByDateResponse(this.success, this.attendance);

  factory FoeAttendanceByDateResponse.fromJson(Map<String,dynamic>json)=>
      _$FoeAttendanceByDateResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$FoeAttendanceByDateResponseToJson(this);

}