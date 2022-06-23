
import 'package:json_annotation/json_annotation.dart';

import 'SurveyPredictionData.dart';



part 'SurveyPredictionDataResponse.g.dart';

@JsonSerializable()
class SurveyPredictionDataResponse{


  String? message;
  List<SurveyPredictionData>? object;


  SurveyPredictionDataResponse(this.message, this.object);

  factory SurveyPredictionDataResponse.fromJson(Map<String,dynamic>json)=>
      _$SurveyPredictionDataResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyPredictionDataResponseToJson(this);
}