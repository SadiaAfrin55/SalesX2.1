// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SurveyPredictionDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyPredictionDataResponse _$SurveyPredictionDataResponseFromJson(
        Map<String, dynamic> json) =>
    SurveyPredictionDataResponse(
      json['message'] as String?,
      (json['object'] as List<dynamic>?)
          ?.map((e) => SurveyPredictionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyPredictionDataResponseToJson(
        SurveyPredictionDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'object': instance.object,
    };
