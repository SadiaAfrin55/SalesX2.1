
import 'package:json_annotation/json_annotation.dart';




part 'VmSignOffAttendance.g.dart';

@JsonSerializable()
class VmSignOffAttendance {

  String? photo;
  String? outTime;
  String? userId;
  String? note;


  VmSignOffAttendance(this.photo, this.outTime, this.userId, this.note);

  factory VmSignOffAttendance.fromJson(Map<String,dynamic>json)=>
      _$VmSignOffAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$VmSignOffAttendanceToJson(this);

}