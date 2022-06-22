// ignore: file_names

import 'package:json_annotation/json_annotation.dart';

import '../VmAttendance/VmSignOffAttendance.dart';
import '../VmAttendance/VmStoreAttendance.dart';
import '../VmAttendance/VmWorkingHourAttendance.dart';

part 'FoeAttendances.g.dart';

@JsonSerializable()
class FoeAttendances {

  @JsonKey(name: "_id")
  String? id;
  String? userId;
  String? businessunit;
  String? LinemanagerId;
  String? dateid;
  String? month;

  VmSignOffAttendance signoffAtd;
  VmWorkingHourAttendance workinghour;
  List<VmStoreAttendance> storeAttendance;


  FoeAttendances(
      this.id,
      this.userId,
      this.businessunit,
      this.LinemanagerId,
      this.dateid,
      this.month,
      this.signoffAtd,
      this.workinghour,
      this.storeAttendance);

  factory FoeAttendances.fromJson(Map<String,dynamic>json)=>
      _$FoeAttendancesFromJson(json);
  Map<String,dynamic>toJson()=>_$FoeAttendancesToJson(this);

}