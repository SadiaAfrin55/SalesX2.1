import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/Attendance/VmAttendance/vmSignoffAtd.dart';
import 'package:salesx_new_project/Data/Model/Attendance/VmAttendance/vmStoreAtd.dart';
import 'package:salesx_new_project/Data/Model/Attendance/VmAttendance/vmWorkinghourAtd.dart';

part 'VmAttendance.g.dart';

@JsonSerializable()
class vmAttendance {
  @JsonKey(name: "_id")
  String? id;
  String userId;
  String LinemanagerId;
  String businessunit;
  String dateid;
  String month;
  String role;

  vmSignoff signoffAtd;
  vmWorkinghour workinghour;
  List<vmStoreAtd> storeAttendance;

  vmAttendance(
      this.id,
      this.userId,
      this.LinemanagerId,
      this.businessunit,
      this.dateid,
      this.month,
      this.role,
      this.signoffAtd,
      this.workinghour,
      this.storeAttendance);

  factory vmAttendance.fromJson(Map<String, dynamic> json) =>
      _$vmAttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$vmAttendanceToJson(this);
}
