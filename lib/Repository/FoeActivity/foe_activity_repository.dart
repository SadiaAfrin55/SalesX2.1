import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Network/FoeActivity/foe_activity_network.dart';
import 'package:salesx_new_project/Network/SecActivity/sec_activity_network.dart';

import '../../Data/Model/Attendance/AttendanceResponse.dart';
import '../../Data/Model/Attendance/AttendanceResponseTwo.dart';
import '../../Network/Attendence/attendence_network.dart';


class FoeActivityRepository {
  var logger = Logger();
  FoeActivityNetwork foeActivityNetwork = FoeActivityNetwork();

  // Future<AttendanceResponse> loadFoeAttendance(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadFoeTarget(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadFoeLeave(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadFoeTraining(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }

}