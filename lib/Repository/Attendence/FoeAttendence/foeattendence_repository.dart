import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';

import '../../../Network/Attendence/FoeAttendence/foeattendence_network.dart';


class FoeAttendanceRepository {
  var logger = Logger();
  FoeAttendenceNetwork foeAttendenceNetwork = FoeAttendenceNetwork();

  Future giveFoeAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon)async {
    final  rawx= foeAttendenceNetwork.giveFoeAttendance(iamge,storeId,businessUnit,useId,note,lat,lon);
    return rawx;
  }

  Future giveSignOffAttendance(File iamge, String useId, String note)async {
    final  rawx=await foeAttendenceNetwork.giveSignOffAttendance(iamge,useId,note);
    return rawx;
  }


  Future chekVmSignffAttendance(String userId) async{
    final rawx=await foeAttendenceNetwork.chekVmSignffAttendance(userId);
    // logger.d(rawx);
    return rawx;
  }

  Future getSecAttenadceSurvey(String userId)async {
    final rawx=await foeAttendenceNetwork.getSecAttenadceSurvey(userId);
    // logger.d(rawx);
    return rawx;
  }

  Future getSecAttenadceSurveyRe(String userId)async {
    final rawx=await foeAttendenceNetwork.getSecAttenadceSurveyRe(userId);
    // logger.d(rawx);
    return rawx;
  }



}