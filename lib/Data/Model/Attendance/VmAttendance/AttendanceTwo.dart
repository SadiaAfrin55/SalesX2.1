// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
import '../../User/UserTwo.dart';
import '../EveingAtd.dart';
import '../MorningAtd.dart';
import '../SignoffAtd.dart';
import '../WorkingHours.dart';



part 'AttendanceTwo.g.dart';

@JsonSerializable()
class AttendanceTwo{

  @JsonKey(name: "_id")
  String? id;
  UserTwo? userId;
  String? businessunit;
  String? role;
  String? dateid;
  String? month;


  MorningAtd? morningAtd;
  EveingAtd? eveningAtd;
  SignoffAtd? signoffAtd;
  WorkingHours? workinghour;


  AttendanceTwo(
      this.id,
      this.userId,
      this.businessunit,
      this.role,
      this.dateid,
      this.month,
      this.morningAtd,
      this.eveningAtd,
      this.signoffAtd,
      this.workinghour);

  factory AttendanceTwo.fromJson(Map<String,dynamic>json)=>
      _$AttendanceTwoFromJson(json);
  Map<String,dynamic>toJson()=>_$AttendanceTwoToJson(this);
}