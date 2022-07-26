import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Network/FoeActivity/foe_activity_network.dart';
import 'package:salesx_new_project/Network/FomActivity/fom_activity_network.dart';
import 'package:salesx_new_project/Network/SecActivity/sec_activity_network.dart';

import '../../Data/Model/Attendance/AttendanceResponse.dart';
import '../../Network/Attendence/attendence_network.dart';


class FomActivityRepository {
  var logger = Logger();
  FomActivityNetwork fomActivityNetwork = FomActivityNetwork();


  // Future<AttendanceResponse> loadFomAttendance(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadFomTarget(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadFomLeave(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadFomTraining(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }

}