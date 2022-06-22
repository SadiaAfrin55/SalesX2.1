

import 'package:json_annotation/json_annotation.dart';




part 'FoeStoreAttendance.g.dart';

@JsonSerializable()
class FoeStoreAttendance {

  String? photo;
  String? storeName;
  String? store;
  String? intime;
  String? userId;
  String? note;


  FoeStoreAttendance(this.photo, this.storeName, this.store, this.intime,
      this.userId, this.note);

  factory FoeStoreAttendance.fromJson(Map<String,dynamic>json)=>
      _$FoeStoreAttendanceFromJson(json);
  Map<String,dynamic>toJson()=>_$FoeStoreAttendanceToJson(this);

}