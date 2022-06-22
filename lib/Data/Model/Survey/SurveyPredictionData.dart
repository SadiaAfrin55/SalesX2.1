
import 'package:json_annotation/json_annotation.dart';



part 'SurveyPredictionData.g.dart';

@JsonSerializable()
class SurveyPredictionData{


  String? day;
  int? value;


  SurveyPredictionData(this.day, this.value);

  factory SurveyPredictionData.fromJson(Map<String,dynamic>json)=>
      _$SurveyPredictionDataFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyPredictionDataToJson(this);
}