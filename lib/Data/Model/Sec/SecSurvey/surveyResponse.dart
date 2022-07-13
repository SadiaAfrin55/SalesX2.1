

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/Sec/SecSurvey/survey.dart';


part 'surveyResponse.g.dart';

@JsonSerializable()
class SecSurveyResponse{

  String? status;
  int? length;
  List<SecSurvey>? surveys;


  SecSurveyResponse(this.status, this.length, this.surveys);

  factory SecSurveyResponse.fromJson(Map<String,dynamic>json)=>
      _$SecSurveyResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SecSurveyResponseToJson(this);
}