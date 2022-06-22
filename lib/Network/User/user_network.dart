import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart';
import '../../Constants/Strings/app_strings.dart';

class UserNetwork {
  var logger = Logger();

  Future getUserDetails(String userEmployeeId) async{
    try{
      var response=await get(Uri.parse(BASE_URL+"users/getUserdetails/"+userEmployeeId));
      logger.d("xxxx  "+response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }

  }
}