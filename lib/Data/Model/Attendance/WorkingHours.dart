
import 'package:json_annotation/json_annotation.dart';



part 'WorkingHours.g.dart';

@JsonSerializable()
class WorkingHours{

  String? photo;
  String? userId;
  String? intime;
  String? outtime;
  String? workingtime;


  WorkingHours(this.photo,this.userId,this.intime, this.outtime, this.workingtime);


  factory WorkingHours.fromJson(Map<String,dynamic>json)=>
      _$WorkingHoursFromJson(json);
  Map<String,dynamic>toJson()=>_$WorkingHoursToJson(this);
}