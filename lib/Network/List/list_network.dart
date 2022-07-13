
import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';

class ListNetwork {
  var logger = Logger();

  Future loadedSec(String linemanagerid)async {
    print("linemannnn "+linemanagerid);
    try{
      final response=await get(Uri.parse(BASE_URL+'users/get-linemanger-users?linemanagerid='+linemanagerid));
       logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future loadedAllSec()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'users/get-linemanger-users?linemanagerid=6151901ebb8c9211f2bec30e'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadedAllSm()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'users/get-linemanger-users?linemanagerid=6151901ebb8c9211f2bec30e'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadedAllFom()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'users/get-linemanger-users?linemanagerid=6151901ebb8c9211f2bec30e'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadedAllFoe()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'users/get-linemanger-users?linemanagerid=615ae6e526547e00086986f3'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future loadedAllSecSurvey()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'survey/get-linemanager-survey?linemanagerid=61d000ae264ff122bc65ba2b&secid=6151a0cc11cb63219269c7e5&fromDate=All&toDate=All'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadedAllSecSales()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'sales/sales-by-user?&fromDate=All&toDate=All'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadSecTrainingByMonth(String leaveDate)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/attandance-training-normal?attendancetype=training&month='+leaveDate+"&userid=61802c52f6cfe42029ea53f0"));
       logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadOmTrainingByMonth(String leaveDate)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/attandance-training-normal?attendancetype=training&month='+leaveDate+"&userid=61802c52f6cfe42029ea53ed"));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadFomTrainingByMonth(String leaveDate)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/attandance-training-normal?attendancetype=training&month='+leaveDate+"&userid=61519073bb8c9211f2bec310"));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadFoeTrainingByMonth(String leaveDate)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/attandance-training-normal?attendancetype=training&month='+leaveDate+"&userid=61802c52f6cfe42029ea53f0"));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future loadAttandanceByMonth(String leaveDate,String linemanagerId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/today-attandance-check?dateid='+leaveDate+'&linemanagerid='+linemanagerId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }




}