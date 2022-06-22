// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Target.dart';
part 'TargetResponse.g.dart';

@JsonSerializable()
class TargetResponse{


  String? status;
  Target? target;
  int? todayTarget;
  int? todayAchive;
  int? YestardayTarget;
  int? YestardayAchive;
  int? lastsevendayTarget;
  int? lastsevendayAchive;


  TargetResponse(
      this.status,
      this.target,
      this.todayTarget,
      this.todayAchive,
      this.YestardayTarget,
      this.YestardayAchive,
      this.lastsevendayTarget,
      this.lastsevendayAchive);

  factory TargetResponse.fromJson(Map<String,dynamic>json)=>
      _$TargetResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$TargetResponseToJson(this);
}