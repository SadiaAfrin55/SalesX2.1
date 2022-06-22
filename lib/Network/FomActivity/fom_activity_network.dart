import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class FomActivityNetwork {
  var logger = Logger();

  Future fomAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future fomTarget(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future fomLeave(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future fomTraining(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

}