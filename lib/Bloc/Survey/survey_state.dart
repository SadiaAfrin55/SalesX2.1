part of 'survey_cubit.dart';

@immutable
abstract class SurveyState {}

class SurveyInitial extends SurveyState {}

class SurveyLoded extends SurveyState {
  final SurveyResponse? surveyResponse;

  SurveyLoded({this.surveyResponse});
}

class SurveyLodedByMonth extends SurveyState {
  final SurveyResponse? surveyResponse;

  SurveyLodedByMonth({this.surveyResponse});
}

class SurveyCreate extends SurveyState {
  final String? response;

  SurveyCreate({this.response});
}

class GetSurveyPradiction extends SurveyState {
  final SurveyPredictionDataResponse? surveyPredictionDataResponse;

  GetSurveyPradiction({this.surveyPredictionDataResponse});
}
