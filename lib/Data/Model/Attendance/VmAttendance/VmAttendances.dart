// ignore: file_names

import 'package:json_annotation/json_annotation.dart';

import 'VmSignOffAttendance.dart';
import 'VmStoreAttendance.dart';
import 'VmWorkingHourAttendance.dart';

part 'VmAttendances.g.dart';

@JsonSerializable()
class VmAttendances {

  @JsonKey(name: "_id")
  String? id;
  String? userId;
  String? businessunit;
  String? LinemanagerId;
  String? dateid;
  String? month;

  VmSignOffAttendance? signoffAtd;
  VmWorkingHourAttendance? workinghour;
  VmStoreAttendance? storeAttendance;


  VmAttendances(
      this.id,
      this.userId,
      this.businessunit,
      this.LinemanagerId,
      this.dateid,
      this.month,
      this.signoffAtd,
      this.workinghour,
      this.storeAttendance);

  factory VmAttendances.fromJson(Map<String,dynamic>json)=>
      _$VmAttendancesFromJson(json);
  Map<String,dynamic>toJson()=>_$VmAttendancesToJson(this);

}