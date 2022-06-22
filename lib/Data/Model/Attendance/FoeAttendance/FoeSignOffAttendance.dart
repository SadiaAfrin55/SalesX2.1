
import 'package:json_annotation/json_annotation.dart';




part 'FoeSignOffAttendance.g.dart';

@JsonSerializable()
class FoeSignOffAttendance {

  String? photo;
  String? outTime;
  String? userId;
  String? note;


  FoeSignOffAttendance(this.photo, this.outTime, this.userId, this.note);

  factory FoeSignOffAttendance.fromJson(Map<String,dynamic>json)=>
      _$FoeSignOffAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$FoeSignOffAttendanceToJson(this);

}