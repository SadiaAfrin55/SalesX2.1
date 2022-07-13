// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/SecTraining/secTraining.dart';

import '../Attendance/TrainingAtd.dart';

part 'secTrainingResponse.g.dart';

@JsonSerializable()
class secTrainingResponse{

  String? status;
  int? length;
  List<secTraining>? attendance;

  secTrainingResponse(this.status, this.length, this.attendance);

  factory secTrainingResponse.fromJson(Map<String,dynamic>json)=>
      _$secTrainingResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$secTrainingResponseToJson(this);
}