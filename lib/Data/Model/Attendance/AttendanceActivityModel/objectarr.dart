// ignore: file_names

import 'package:json_annotation/json_annotation.dart';

part 'objectarr.g.dart';

@JsonSerializable()
class attendanceObject{
  
  String normalintime;
  String outtime;
  String name;


  attendanceObject(this.normalintime, this.outtime, this.name);

  factory attendanceObject.fromJson(Map<String,dynamic>json)=>
      _$attendanceObjectFromJson(json);
  Map<String,dynamic>toJson()=>_$attendanceObjectToJson(this);
}