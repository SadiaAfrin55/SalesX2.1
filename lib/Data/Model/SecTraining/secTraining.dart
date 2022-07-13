// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/SecTraining/traingAtd.dart';

import '../Attendance/TrainingAtd.dart';

part 'secTraining.g.dart';

@JsonSerializable()
class secTraining{

  SecTrainingAtdModel? trainingAtd;

  secTraining(this.trainingAtd);

  factory secTraining.fromJson(Map<String,dynamic>json)=>
      _$secTrainingFromJson(json);
  Map<String,dynamic>toJson()=>_$secTrainingToJson(this);
}