// ignore: file_names
import 'package:json_annotation/json_annotation.dart';

import 'FoeAttendances.dart';





part 'FoeAttendanceResponse.g.dart';

@JsonSerializable()
class FoeAttendanceResponse {

  bool? success;
  List<FoeAttendances>? attendance;


  FoeAttendanceResponse(this.success, this.attendance);

  factory FoeAttendanceResponse.fromJson(Map<String,dynamic>json)=>
      _$FoeAttendanceResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$FoeAttendanceResponseToJson(this);

}