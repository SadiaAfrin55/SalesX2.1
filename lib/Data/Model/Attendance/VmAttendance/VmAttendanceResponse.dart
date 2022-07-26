
import 'package:json_annotation/json_annotation.dart';

import 'VmAttendance.dart';

part 'VmAttendanceResponse.g.dart';

@JsonSerializable()
class vmAttendanceResponse{

  bool? success;
  List<vmAttendance> attendance;


  vmAttendanceResponse(this.success, this.attendance);

  factory vmAttendanceResponse.fromJson(Map<String,dynamic>json)=>
      _$vmAttendanceResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$vmAttendanceResponseToJson(this);
}