import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class OmActivityNetwork {
  var logger = Logger();

  Future omAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future omTarget(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future omLeave(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future omTraining(String userId)async {
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