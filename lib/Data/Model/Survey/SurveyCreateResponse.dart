

import 'package:json_annotation/json_annotation.dart';

import 'Survey.dart';


part 'SurveyCreateResponse.g.dart';

@JsonSerializable()
class SurveyCreateResponse{
  final String? status;
  final Survey? newSurvey;


  SurveyCreateResponse(this.status, this.newSurvey);

  factory SurveyCreateResponse.fromJson(Map<String,dynamic>json)=>
      _$SurveyCreateResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyCreateResponseToJson(this);
}