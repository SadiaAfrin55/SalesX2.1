// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SurveyResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) =>
    SurveyResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['surveys'] as List<dynamic>?)
          ?.map((e) => Survey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyResponseToJson(SurveyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'surveys': instance.surveys,
    };
