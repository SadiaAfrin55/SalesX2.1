
import 'package:json_annotation/json_annotation.dart';

import 'SurveyPredictionData.dart';



part 'SurveyPredictionDataResponse.g.dart';

@JsonSerializable()
class SurveyPredictionDataResponse{


  String? status;
  List<SurveyPredictionData>? surveyData;


  SurveyPredictionDataResponse(this.status, this.surveyData);

  factory SurveyPredictionDataResponse.fromJson(Map<String,dynamic>json)=>
      _$SurveyPredictionDataResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyPredictionDataResponseToJson(this);
}