// ignore: file_names
import 'package:json_annotation/json_annotation.dart';

import 'VmAttendances.dart';




part 'VmAttendanceResponse.g.dart';

@JsonSerializable()
class VmAttendanceResponse {

  bool? success;
  List<VmAttendances>? attendance;


  VmAttendanceResponse(this.success, this.attendance);

  factory VmAttendanceResponse.fromJson(Map<String,dynamic>json)=>
      _$VmAttendanceResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$VmAttendanceResponseToJson(this);

}