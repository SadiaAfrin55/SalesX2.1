// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SurveyPredictionDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyPredictionDataResponse _$SurveyPredictionDataResponseFromJson(
        Map<String, dynamic> json) =>
    SurveyPredictionDataResponse(
      json['status'] as String?,
      (json['surveyData'] as List<dynamic>?)
          ?.map((e) => SurveyPredictionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyPredictionDataResponseToJson(
        SurveyPredictionDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'surveyData': instance.surveyData,
    };
