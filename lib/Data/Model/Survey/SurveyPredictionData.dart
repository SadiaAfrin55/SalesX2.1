
import 'package:json_annotation/json_annotation.dart';



part 'SurveyPredictionData.g.dart';

@JsonSerializable()
class SurveyPredictionData{


  String? month;
  int? totalsurvey;


  SurveyPredictionData(this.month, this.totalsurvey);

  factory SurveyPredictionData.fromJson(Map<String,dynamic>json)=>
      _$SurveyPredictionDataFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyPredictionDataToJson(this);
}