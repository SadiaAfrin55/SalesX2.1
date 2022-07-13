// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveyResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecSurveyResponse _$SecSurveyResponseFromJson(Map<String, dynamic> json) =>
    SecSurveyResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['surveys'] as List<dynamic>?)
          ?.map((e) => SecSurvey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SecSurveyResponseToJson(SecSurveyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'surveys': instance.surveys,
    };
