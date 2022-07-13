
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import '../../../Data/Model/Attendance/VmAttendance/VmAttendanceByDateResponse.dart';
import '../../../Data/Model/Attendance/VmAttendance/VmAttendanceResponse.dart';
import '../../../Network/Attendence/VmAttendence/vm_attendence_network.dart';


class VmAttendanceRepository {
  var logger = Logger();

  Future giveVmAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon, String userAddress)async {
    final  rawx= VmAttendanceService().giveVmAttendance(iamge,storeId,businessUnit,useId,note,lat,lon,userAddress);
    return rawx;
  }

  Future giveSignOffAttendance(File iamge, String useId, String note,String lat,String lon, String userAddress)async {
    final  rawx=await VmAttendanceService().giveSignOffAttendance(iamge,useId,note,lat,lon,userAddress);
    return rawx;
  }

  Future<VmAttendanceResponse> loadVmAttendance(String userId) async{
    final rawx=await VmAttendanceService().loadVmAttendance(userId);
    logger.d(rawx);
    return VmAttendanceResponse.fromJson(rawx);
  }

  Future loadVmAttendanceByMonth(String userId, String leaveDate) async{
    final rawx=await VmAttendanceService().loadVmAttendanceByMonth(userId,leaveDate);
    logger.d(rawx);
    return rawx;
  }

  Future chekVmSignffAttendance(String userId) async{
    final rawx=await VmAttendanceService().chekVmSignffAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }

  Future<VmAttendanceResponse> loadVmAttendanceforSignOff(String userId) async{
    final rawx=await VmAttendanceService().loadVmAttendanceforSignOff(userId);
    logger.d(rawx);
    return VmAttendanceResponse.fromJson(rawx);
  }



  Future giveReAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon, String userAddress)async {
    final  rawx= VmAttendanceService().giveReAttendance(iamge,storeId,businessUnit,useId,note,lat,lon,userAddress);
    return rawx;
  }


  Future giveReSignOffAttendance(File iamge, String useId, String note,String lat,String lon, String userAddress)async {
    final  rawx=await VmAttendanceService().giveReSignOffAttendance(iamge,useId,note,lat,lon,userAddress);
    return rawx;
  }


  Future chekReSignffAttendance(String userId) async{
    final rawx=await VmAttendanceService().chekReSignffAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }

  Future<VmAttendanceResponse> loadReAttendance(String userId) async{
    final rawx=await VmAttendanceService().loadReAttendance(userId);
    logger.d(rawx);
    return VmAttendanceResponse.fromJson(rawx);
  }

  Future loadReAttendanceByMonth(String userId, String leaveDate) async{
    final rawx=await VmAttendanceService().loadReAttendanceByMonth(userId,leaveDate);
    // logger.d(rawx);
    return rawx;
  }


  Future<VmAttendanceByDateResponse> Vmattendancehistory(String leaveDate,String userId) async{
    print(userId);
    print(leaveDate);
    final rawx=await VmAttendanceService().loadVmAttendanceByMonth(leaveDate,userId);
    logger.d(rawx);
    return VmAttendanceByDateResponse.fromJson(rawx);
  }



  Future  chekVmAttendance(String userId)async {
    final rawx=await VmAttendanceService().chekVmAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }

  Future chekReAttendance(String userId)async {
    final rawx=await VmAttendanceService().chekReAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }
}