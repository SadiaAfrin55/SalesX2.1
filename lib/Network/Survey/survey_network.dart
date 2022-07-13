import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class SurveyNetwork {
  var logger = Logger();
  Future getSurveyList(String token) async{

    try{
      final response=await http.get(Uri.parse(BASE_URL+'survey'));
      logger.d(response.body);
      return json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {

      }

    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future createSurvey(Map<String, String> data, String token) async{
    try {
      var response = await post(
        Uri.parse(BASE_URL + "survey"),
        headers: {
          "Content-type": "application/json",
          "Authorization":"Bearer $token"
        },
        body: json.encode(data),
      );
      logger.d(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future loadedUserSurvey(String userId) async{
    try{

      final response=await http.get(Uri.parse(BASE_URL+'survey/getSurvyByUser/'+userId));
       logger.d(response.body);

      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getUserSurveyByMonth(String userId, String date) async{
    logger.d(date);
    try{
      final response=await http.get(Uri.parse(BASE_URL+'survey/getSurvyByUserMonth/'+userId+'/'+date),
        headers: {
          "Accept": "application/json"
        },
      );
       logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getUserSurveyPrediction(String userId,String year) async{
    print("charttt");
    try{
      final response=await http.get(Uri.parse(BASE_URL+'survey/get-yearly-survey?userid='+userId+"&year="+year));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }


}