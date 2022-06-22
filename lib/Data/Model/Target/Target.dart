// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
part 'Target.g.dart';

@JsonSerializable()
class Target{

  @JsonKey(name: "_id")
  String? id;
  int? achiveTarget;
  String? user;
  int? actualTarget;
  String? month;


  Target(this.id, this.achiveTarget, this.user, this.actualTarget, this.month);

  factory Target.fromJson(Map<String,dynamic>json)=>
      _$TargetFromJson(json);
  Map<String,dynamic>toJson()=>_$TargetToJson(this);
}