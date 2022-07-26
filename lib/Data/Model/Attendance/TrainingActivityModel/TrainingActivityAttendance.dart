
import 'package:json_annotation/json_annotation.dart';

import 'TrainingAtd.dart';

part 'TrainingActivityAttendance.g.dart';

@JsonSerializable()
class TrainingActivityAttendance{

  @JsonKey(name: "_id")
  String id;
  String dateid;
  TrainingActivityAtd trainingAtd;


  TrainingActivityAttendance(this.id, this.dateid, this.trainingAtd);

  factory TrainingActivityAttendance.fromJson(Map<String,dynamic>json)=>
      _$TrainingActivityAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$TrainingActivityAttendanceToJson(this);
}