// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/Attendance/TrainingAtd.dart';

import 'EveingAtd.dart';
import 'MorningAtd.dart';
import 'SignoffAtd.dart';
import 'WorkingHours.dart';


part 'Attendance.g.dart';

@JsonSerializable()
class Attendance{

  @JsonKey(name: "_id")
  String? id;
  String? userId;
  String? businessunit;
  String? role;
  String? dateid;
  String? month;


  MorningAtd? morningAtd;
  EveingAtd? eveningAtd;
  SignoffAtd? signoffAtd;
  WorkingHours? workinghour;
  TrainingAtd? trainingAtd;


  Attendance(
      this.id,
      this.userId,
      this.businessunit,
      this.role,
      this.dateid,
      this.month,
      this.morningAtd,
      this.eveningAtd,
      this.signoffAtd,
      this.workinghour,
      this.trainingAtd);

  factory Attendance.fromJson(Map<String,dynamic>json)=>
      _$AttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$AttendanceToJson(this);
}