import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../Constants/Strings/app_strings.dart';

class FoeAttendenceNetwork {
  var logger = Logger();

  Future giveFoeAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon)async {
    print("store id is "+storeId);
    print("business id is "+businessUnit);
    try{
      var request =  http.MultipartRequest(
          'POST', Uri.parse("https://api.salesx-staging.xyz/api/v1/foeAttendance/givefirstAttendance/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['store'] = storeId;
      request.fields['note'] = note;
      request.fields['lat'] = lat;
      request.fields['lon'] = lon;
      logger.d(iamge.path);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future giveSignOffAttendance(File iamge, String useId, String note)async {
    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"foeAttendance/foeSignoff/"+useId)
      );
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['note'] = note;
      logger.d(iamge.path);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }



  Future loadVmAttendance(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'foeAttendance/getFoeAttendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadVmAttendanceByMonth(String userId, String leaveDate) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'foeAttendance/getFoeAttendancebydate/'+userId+"?date="+leaveDate));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future chekVmSignffAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'foeAttendance/checkFoeSignOff/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getSecAttenadceSurvey(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'foeAttendance/getSecAttendanceData/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getSecAttenadceSurveyRe(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'reAttandance/getSecAttendanceData/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }



}