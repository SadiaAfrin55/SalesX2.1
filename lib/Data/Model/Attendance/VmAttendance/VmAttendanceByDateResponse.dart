// ignore: file_names
import 'package:json_annotation/json_annotation.dart';

import 'VmAttendanceResponse.dart';
import 'VmAttendances.dart';




part 'VmAttendanceByDateResponse.g.dart';

@JsonSerializable()
class VmAttendanceByDateResponse {

  bool? success;
  List<VmAttendances>? attendance;


  VmAttendanceByDateResponse(this.success, this.attendance);

  factory VmAttendanceByDateResponse.fromJson(Map<String,dynamic>json)=>
      _$VmAttendanceByDateResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$VmAttendanceByDateResponseToJson(this);

}