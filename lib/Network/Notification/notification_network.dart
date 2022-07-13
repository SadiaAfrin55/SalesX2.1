
import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';

class NotificationNetwork {
  var logger = Logger();

  Future loadedAllNotification()async {
    try{
      final response=await get(Uri.parse(BASE_URL+'notice'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future loadedYourNotification(String userId)async {
    try{
      final response=await get(Uri.parse(BASE_URL+'notice/user/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }
}