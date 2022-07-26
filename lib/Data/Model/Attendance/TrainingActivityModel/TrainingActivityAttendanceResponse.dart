
import 'package:json_annotation/json_annotation.dart';

import 'TrainingActivityAttendance.dart';

part 'TrainingActivityAttendanceResponse.g.dart';

@JsonSerializable()
class TrainingActivityAttendanceResponse{

  String? status;
  int? length;
  List<TrainingActivityAttendance>? attendance;


  TrainingActivityAttendanceResponse(this.status, this.length, this.attendance);

  factory TrainingActivityAttendanceResponse.fromJson(Map<String,dynamic>json)=>
      _$TrainingActivityAttendanceResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$TrainingActivityAttendanceResponseToJson(this);
}