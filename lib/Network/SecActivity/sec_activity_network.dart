import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class SecActivityNetwork {
  var logger = Logger();

  Future secAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future secSales(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future secSurvey(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future secTarget(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future secInventory(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future secLeave(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
  Future secTraining(String userId)async {
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