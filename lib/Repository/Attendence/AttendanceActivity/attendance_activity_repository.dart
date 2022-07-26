
import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Network/Attendence/AttendanceActivity/attendance_activity_network.dart';

import '../../../Data/Model/Attendance/AttendanceActivityModel/objResponse.dart';
import '../../../Data/Model/Attendance/TrainingActivityModel/TrainingActivityAttendanceResponse.dart';

class AttendanceActivityRepository{
  var logger = Logger();

  Future<attendanceObjectResponse> attendanceHistory(String linemanagerId) async{
    final rawx=await AttendanceActivityNetwork().attendanceActivityHistory(linemanagerId);
    logger.d(rawx);
    return attendanceObjectResponse.fromJson(rawx);
  }

  Future<TrainingActivityAttendanceResponse> trainingHistory(String userId) async{
    final rawx=await AttendanceActivityNetwork().trainingActivityHistory(userId);
    logger.d(rawx);
    return TrainingActivityAttendanceResponse.fromJson(rawx);
  }

}