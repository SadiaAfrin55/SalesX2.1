

import 'package:json_annotation/json_annotation.dart';


import 'Survey.dart';

part 'SurveyResponse.g.dart';

@JsonSerializable()
class SurveyResponse{
  final String? status;
  final int? length;
  final List<Survey>? surveys;


  SurveyResponse(this.status, this.length, this.surveys);

  factory SurveyResponse.fromJson(Map<String,dynamic>json)=>
      _$SurveyResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyResponseToJson(this);
}