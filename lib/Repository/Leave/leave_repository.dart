import 'dart:developer';

import 'package:logger/logger.dart';

import '../../Data/Model/Leave/LeaveCreateResponse.dart';
import '../../Data/Model/Leave/LeaveResponse.dart';
import '../../Data/Model/Leave/TotalLeave.dart';
import '../../Network/Leave/Leave_network.dart';


class LeaveRepository {
  var logger = Logger();

  Future<LeaveResponse?> getLeave(String userId,String token) async{
    logger.d("repository");
    final leaveRaw=await LeaveNetwork().getLeaveList(userId,token);
    LeaveResponse leaveResponse=LeaveResponse.fromJson(leaveRaw);
    logger.d(leaveResponse.leaveform);
    if(leaveResponse!=null){
      return  LeaveResponse.fromJson(leaveRaw);
    }else{
      return null;
    }
  }

  Future<LeaveResponse?> getLeaveByMonth(String userId, String leaveDate) async{
    final leaveRaw=await LeaveNetwork().getLeaveListByMonth(userId,leaveDate);

    final leaveResponse=LeaveResponse.fromJson(leaveRaw);

      return  leaveResponse;
  }

  Future<LeaveCreateResponse?> createLevae(String date,String reason,String leaveFormat,String userId,String linmanagerid,String acceptence,String token) async {
    print("leave repository api");
    Map<String, String> data = {
      "date": date,
      "reason": reason,
      "leaveformat": leaveFormat,
      "acceptence": acceptence,
      "user": userId,
      "linemanager": linmanagerid,

    };
    final LeaveResRaw = await LeaveNetwork().createLeave(data, token);
    if (LeaveResRaw == null) return null;
    logger.d(LeaveResRaw);
    return LeaveCreateResponse.fromJson(LeaveResRaw);
  }

  Future<LeaveResponse?> loadedPendingLeave(String userId,String status, String token) async{
    // logger.d("repository");
    final leaveRaw=await LeaveNetwork().loadedPendingLeave(userId,status,token);
    LeaveResponse leaveResponse=LeaveResponse.fromJson(leaveRaw);
    // logger.d(leaveResponse.leaveform);
    if(leaveResponse!=null){
      return  LeaveResponse.fromJson(leaveRaw);
    }else{
      return null;
    }
  }


  Future<LeaveCreateResponse?> updateLeaveStatus(String id, String status) async {
    final LeaveResRaw = await LeaveNetwork().updateLeaveStatus(id, status);
    if (LeaveResRaw == null) return null;
    logger.d(LeaveResRaw);
    return LeaveCreateResponse.fromJson(LeaveResRaw);
  }

  Future<TotalLeave?> getLeaveTotal(String id) async {
    final LeaveResRaw = await LeaveNetwork().getLeaveTotal(id);
    if (LeaveResRaw == null) return null;
    logger.d(LeaveResRaw);
    return TotalLeave.fromJson(LeaveResRaw);
  }

}