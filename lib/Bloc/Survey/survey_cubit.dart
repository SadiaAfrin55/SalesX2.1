import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Survey/Survey.dart';
import '../../Data/Model/Survey/SurveyCreateResponse.dart';
import '../../Data/Model/Survey/SurveyPredictionDataResponse.dart';
import '../../Data/Model/Survey/SurveyResponse.dart';
import '../../Repository/Survey/survey_repository.dart';
part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  var logger = Logger();

  SurveyCubit() : super(SurveyInitial());

  void loadedSurvey(String token){
    SurveyRepository().getSurvey(token).then((survey){
      logger.d(survey);
      if(survey!=null){
        emit(SurveyLoded(surveyResponse: survey));
      }
    });
  }

  void createSurvey(String customername,String userId,String date,String dateIn,String interestedin,String customercontactno,String customerage,String customeremail,String customerbudget,String customercurrentphone,String pricerange){

    SurveyRepository().createSurvey(customername,userId,date,dateIn,interestedin,customercontactno,customerage,customeremail,customerbudget,customercurrentphone,pricerange).then((survey) {
      if(survey!=null){
        logger.d(survey);
        emit(SurveyCreate(response: "ok"));
      }
    });
  }

  void loadedUserSurvey(String userId) {
    SurveyRepository().loadedUserSurvey(userId).then((survey){
      logger.d(survey);
      if(survey!=null){
        emit(SurveyLoded(surveyResponse: survey));
      }
    });
  }

  void getUserSurveyByMonth(String userId, String date) {
    SurveyRepository().getUserSurveyByMonth(userId,date).then((survey){
      logger.d(survey);
      if(survey!=null){
        emit(SurveyLodedByMonth(surveyResponse: survey));
      }
    });
  }

  void getUserSurveyPrediction(String userId) {
    SurveyRepository().getUserSurveyPrediction(userId).then((response){
      // logger.d(response);
      if(response!=null){
        emit(GetSurveyPradiction(surveyPredictionDataResponse:response));
      }
    });
  }



}
