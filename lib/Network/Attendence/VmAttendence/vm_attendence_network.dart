
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../Constants/Strings/app_strings.dart';


class VmAttendanceService {

  var logger = Logger();

  Future giveVmAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon, String userAddress)async {
    logger.d(userAddress);
    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"vmAttendance/givefirstAttendance/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      if(storeId!=""){
        request.fields['store'] =storeId;
      }
      request.fields['note'] = note;
      request.fields['lat'] = lat;
      request.fields['lon'] = lon;
      request.fields['address'] = userAddress;
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

  Future giveSignOffAttendance(File iamge, String useId, String note,String lat,String lon, String userAddress)async {
    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"vmAttendance/vmSignoff/"+useId)
      );
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['note'] = note;
      request.fields['lat'] = lat;
      request.fields['lon'] = lon;
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

  Future loadVmAttendance(String userId) async{
    logger.d(userId);
    try{
      final response=await get(Uri.parse(BASE_URL+'vmAttendance/getVmAttendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }



  Future profileinfo(String userId) async{
    logger.d(userId);
    try{
      final response=await get(Uri.parse(BASE_URL+'users/get-user-profile/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadVmAttendanceByMonth(String userId, String leaveDate) async{
    print('vm userid'+userId);
    print('vm date'+leaveDate);
    try{
      final response=await get(Uri.parse(BASE_URL+'vmAttendance/getVmAttendancebydate/'+userId+'?date='+leaveDate));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future chekVmSignffAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'vmAttendance/checkVMSignOff/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadVmAttendanceforSignOff(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'vmAttendance/getsupunderatd/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future giveReAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon, String userAddress)async {
    logger.d(userAddress);
    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"reAttandance/givefirstAttendance/"+useId)
      );
      request.fields['businessunit'] = businessUnit;
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      if(storeId!=""){
        request.fields['store'] =storeId;
      }
      request.fields['note'] = note;
      request.fields['lat'] = lat;
      request.fields['lon'] = lon;
      request.fields['address'] = userAddress;
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


  Future giveReSignOffAttendance(File iamge, String useId, String note,String lat,String lon, String userAddress)async {
    print(useId);
    print(lat);
    print(lon);
    print(iamge.path);
    try{
      var request =  http.MultipartRequest(
          'PATCH', Uri.parse(BASE_URL+"reAttandance/reSignoff/"+useId)
      );
      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['note'] = note;
      request.fields['lat'] = lat;
      request.fields['lon'] = lon;
      request.fields['address'] = userAddress;
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

  Future chekReSignffAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'reAttandance/checkreSignOff/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadReAttendance(String userId) async{
    logger.d(userId);
    try{
      final response=await get(Uri.parse(BASE_URL+'reAttandance/getreAttendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future loadReAttendanceByMonth(String userId, String leaveDate) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'reAttandance/getreAttendancebydate/'+userId+"?date="+leaveDate));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future chekVmAttendance(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'vmAttendance/checkVMAttendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      // logger.d(e);
      return null;
    }
  }

  Future chekReAttendance(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'reAttandance/checkreAttendance/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      // logger.d(e);
      return null;
    }
  }
}