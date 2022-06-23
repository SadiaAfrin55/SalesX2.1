import 'package:logger/logger.dart';

import '../../Data/Model/Survey/SurveyCreateResponse.dart';
import '../../Data/Model/Survey/SurveyPredictionDataResponse.dart';
import '../../Data/Model/Survey/SurveyResponse.dart';
import '../../Network/Survey/survey_network.dart';

class SurveyRepository {
  var logger = Logger();
  SurveyNetwork surveyNetwork=SurveyNetwork();

  Future<SurveyResponse> getSurvey(String token) async{
    final surveyRaw=await SurveyNetwork().getSurveyList(token);
    SurveyResponse surveyResponse=SurveyResponse.fromJson(surveyRaw);
    logger.d(surveyResponse);
    return  SurveyResponse.fromJson(surveyRaw);
  }

  Future createSurvey(String customername,String userId,String date,String dateIn, String interestedin, String customercontactno, String customerage, String customeremail, String customerbudget, String customercurrentphone, String pricerange)async {
    Map<String, String> data = {
      "customername":customername,
      "userId":userId,
      "date":date,
      "dataIn":dateIn,
      "interestedin": interestedin,
      "customercontactno": customercontactno,
      "customerage": customerage,
      "customeremail": customeremail,
      "customerbudget": customerbudget,
      "customercurrentphone": customercurrentphone,
      "pricerange": pricerange,
    };
    final surveyResRaw=  surveyNetwork.createSurvey(data,"token");
    logger.d(surveyResRaw);
    return  surveyResRaw;
  }

  Future<SurveyResponse> loadedUserSurvey(String userId) async{
    final surveyRaw=await SurveyNetwork().loadedUserSurvey(userId);
    SurveyResponse surveyResponse=SurveyResponse.fromJson(surveyRaw);
    logger.d(surveyResponse);
    return  SurveyResponse.fromJson(surveyRaw);
  }

  Future<SurveyResponse> getUserSurveyByMonth(String userId, String date) async{
    final surveyRaw=await SurveyNetwork().getUserSurveyByMonth(userId,date);
    SurveyResponse surveyResponse=SurveyResponse.fromJson(surveyRaw);
    logger.d(surveyResponse);
    return  SurveyResponse.fromJson(surveyRaw);
  }

  Future<SurveyPredictionDataResponse> getUserSurveyPrediction(String userId,String year)async {
    final rawx=await SurveyNetwork().getUserSurveyPrediction(userId,year);
    logger.d(rawx);
    return SurveyPredictionDataResponse.fromJson(rawx);
  }

}