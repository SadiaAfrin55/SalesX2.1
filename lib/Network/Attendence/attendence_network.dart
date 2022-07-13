import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class AttendanceNetwork {

  var logger = Logger();
  Future checkHoliday(String formattedDate) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/chekHoliday/'+formattedDate),
        headers: {
          "Content-type": "application/json",
        },
      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }

  Future checkLateAttendance(String formattedDate)async {
    // logger.d(formattedDate);
    try{
      final response=await get(Uri.parse(BASE_URL+'timeSedule/checkTime/'+formattedDate));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      // logger.d(e);
      return null;
    }
  }

  Future giveMorningAttendance (File iamge, String storeId, String businessUnit, String useId,String role, String userAddress) async{
    print(businessUnit);
    print(storeId);
    print(role);
    print(useId);
    try{
      var request =  http.MultipartRequest(
          'POST', Uri.parse(BASE_URL+"attendance/morningattendance/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.fields['role'] = role;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['store'] = storeId;
      request.fields['address'] = userAddress;
      logger.d(iamge.path);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      logger.d('745 ${response.body}');
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future giveEveningAttendance(File iamge, String storeId, String businessUnit, String useId)async {
    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"attendance/eveningattendance/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.fields['store'] = storeId;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      logger.d(iamge.path);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      // logger.d(e);
      return null;
    }
  }



  Future giveDayoffAttendance(File iamge, String storeId, String businessUnit, String useId, String userAddress) async{
    print(iamge);
    print(storeId);
    print(businessUnit);
    print(useId);
    print(userAddress);

    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"attendance/signoff/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.fields['store'] = storeId;
      request.fields['address'] = userAddress;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      logger.d(iamge.path);
      logger.d(businessUnit);
      logger.d(storeId);
      logger.d(userAddress);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future chekUserAttendance(useId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/chekUserAttendance/'+useId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future chekUserEveningAttendance(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/chekUserEveningAttendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future chekUserDayoffAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/chekUserDayoffAttendance/'+userId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadUserAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/userattandance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadUserAttendanceByMonth(String userId, String leaveDate)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/usermonthlyattandance/'+userId+"/"+leaveDate));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future giveMorningLateAttendance(File iamge, String storeId, String businessUnit, String useId, String role, String note, String userAddress)async {
    try{
      var request =  http.MultipartRequest(
          'POST', Uri.parse(BASE_URL+"attendance/morningattendancelate/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.fields['role'] = role;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['store'] = storeId;
      request.fields['morningremarks'] = note;
      request.fields['address'] = userAddress;
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

  chekVmSignffAttendance(String userId) {}

  Future giveTrainingAttendance(File iamge, String businessUnit, String useId, String role, String userAddress) async{
    print("businessUnit id is "+businessUnit);
    print("role id is "+role);
    print("useId id is "+useId);
    print("userAddress id is "+userAddress);
    try{
      var request =  http.MultipartRequest(
          'POST', Uri.parse(BASE_URL+"attendance/tariningattendance/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.fields['role'] = role;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['address'] = userAddress;
      //logger.d(iamge.path);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadSecAttendance(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/secattendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


}