import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Network/FoeActivity/foe_activity_network.dart';
import 'package:salesx_new_project/Network/FomActivity/fom_activity_network.dart';
import 'package:salesx_new_project/Network/OmActivity/om_activity_network.dart';
import 'package:salesx_new_project/Network/SecActivity/sec_activity_network.dart';

import '../../Data/Model/Attendance/AttendanceResponse.dart';
import '../../Data/Model/Attendance/AttendanceResponseTwo.dart';
import '../../Network/Attendence/attendence_network.dart';


class OmActivityRepository {
  var logger = Logger();
  OmActivityNetwork omActivityNetwork = OmActivityNetwork();

  // Future<AttendanceResponse> loadOmAttendance(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadOmTarget(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadOmLeave(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadOmTraining(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }

}