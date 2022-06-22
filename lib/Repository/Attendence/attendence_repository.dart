import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';

import '../../Data/Model/Attendance/AttendanceResponse.dart';
import '../../Data/Model/Attendance/AttendanceResponseTwo.dart';
import '../../Data/Model/Holiday/HolidayResponse.dart';
import '../../Network/Attendence/attendence_network.dart';


class AttendanceRepository {
  var logger = Logger();

  // Future<HolidayResponse> checkHoliday(String formattedDate) async{
  //   final raw = await AttendanceNetwork().checkHoliday(formattedDate);
  //   if (raw == null) return null;
  //   // logger.d(raw);
  //   return HolidayResponse.fromJson(raw);
  // }

  Future checkLateAttendance(String formattedDate)async {
    final Raw=await AttendanceNetwork().checkLateAttendance(formattedDate);
    logger.d(Raw);
    return  Raw;
  }

  Future giveMorningAttendance(File iamge, String storeId, String businessUnit,String useId,String role, String userAddress) async{
    final rawx=await AttendanceNetwork().giveMorningAttendance(iamge,storeId,businessUnit,useId,role,userAddress);
    // logger.d('5555 $rawx');
    return rawx;
  }

  Future giveEveningAttendance(File iamge, String storeId, String businessUnit, String useId) async{
    final rawx=await AttendanceNetwork().giveEveningAttendance(iamge,storeId,businessUnit,useId);
    // logger.d(rawx);
    return rawx;
  }



  Future giveDayoffAttendance(File iamge, String storeId, String businessUnit, String useId, String userAddress)async {
    final rawx=await AttendanceNetwork().giveDayoffAttendance(iamge,storeId,businessUnit,useId,userAddress);
    //logger.d(rawx);
    return rawx;
  }

  Future chekUserAttendance(String userId)async{
    final rawx=await AttendanceNetwork().chekUserAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }


  Future chekUserEveningAttendance(String userId) async{
    final rawx=await AttendanceNetwork().chekUserEveningAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }

  Future chekUserDayoffAttendance(String userId) async{
    final rawx=await AttendanceNetwork().chekUserDayoffAttendance(userId);
     logger.d(rawx);
    return rawx;
  }


  Future<AttendanceResponse> loadUserAttendance(String userId) async{
    final rawx=await AttendanceNetwork().loadUserAttendance(userId);
    logger.d(rawx);
    return AttendanceResponse.fromJson(rawx);
  }


  Future<AttendanceResponse> loadUserAttendanceByMonth(String userId, String leaveDate) async{
    final rawx=await AttendanceNetwork().loadUserAttendanceByMonth(userId,leaveDate);
    logger.d(rawx);
    return AttendanceResponse.fromJson(rawx);
  }

  Future giveMorningLateAttendance(File iamge, String storeId, String businessUnit, String useId, String role, String note, String userAddress) async{
    final rawx=await AttendanceNetwork().giveMorningLateAttendance(iamge,storeId,businessUnit,useId,role,note,userAddress);
    logger.d(rawx);
    return rawx;
  }

  Future giveTrainingAttendance(File iamge, String businessUnit, String useId, String role, String userAddress)async {
    final rawx=await AttendanceNetwork().giveTrainingAttendance(iamge,businessUnit,useId,role,userAddress);
    //logger.d(rawx);
    return rawx;
  }


  Future<AttendanceResponseTwo> loadSecAttendance(String userId) async{
    final rawx=await AttendanceNetwork().loadSecAttendance(userId);
    logger.d(rawx);
    return AttendanceResponseTwo.fromJson(rawx);
  }

  Future<HolidayResponse> checkHoliday(String formattedDate) async{
    final raw = await AttendanceNetwork().checkHoliday(formattedDate);
    return HolidayResponse.fromJson(raw);
  }
}