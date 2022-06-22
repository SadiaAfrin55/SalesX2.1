import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Network/SecActivity/sec_activity_network.dart';

import '../../Data/Model/Attendance/AttendanceResponse.dart';
import '../../Data/Model/Attendance/AttendanceResponseTwo.dart';
import '../../Network/Attendence/attendence_network.dart';


class SecActivityRepository {
  var logger = Logger();
  SecActivityNetwork secActivityNetwork = SecActivityNetwork();

  // Future<AttendanceResponse> loadSecAttendance(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadSecSales(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadSecSurvey(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadSecTarget(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadSecInventory(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadSecLeave(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }
  //
  // Future<AttendanceResponse> loadSecTraining(String userId) async{
  //   final rawx=await AttendanceNetwork().loadSecSales(userId);
  //   logger.d(rawx);
  //   return AttendanceResponse.fromJson(rawx);
  // }

}