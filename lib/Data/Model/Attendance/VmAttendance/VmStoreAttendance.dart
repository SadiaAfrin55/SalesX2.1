

import 'package:json_annotation/json_annotation.dart';




part 'VmStoreAttendance.g.dart';

@JsonSerializable()
class VmStoreAttendance {

  String? photo;
  String? storeName;
  String? store;
  String? intime;
  String? userId;
  String? note;


  VmStoreAttendance(this.photo, this.storeName, this.store, this.intime,
      this.userId, this.note);

  factory VmStoreAttendance.fromJson(Map<String,dynamic>json)=>
      _$VmStoreAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$VmStoreAttendanceToJson(this);

}