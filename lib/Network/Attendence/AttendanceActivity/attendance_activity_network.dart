import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../Constants/Strings/app_strings.dart';

class AttendanceActivityNetwork{
  var logger = Logger();

  Future attendanceActivityHistory(String linemanagerId) async{
    logger.d(linemanagerId);
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/today-attandance-check?dateid=07/21/2022&linemanagerid='+linemanagerId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future trainingActivityHistory(String userId) async{
    logger.d(userId);
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/attandance-training-normal?month=07-2022&attendancetype=training&userid='+userId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

}