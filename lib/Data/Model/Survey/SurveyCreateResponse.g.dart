// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SurveyCreateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyCreateResponse _$SurveyCreateResponseFromJson(
        Map<String, dynamic> json) =>
    SurveyCreateResponse(
      json['status'] as String?,
      json['newSurvey'] == null
          ? null
          : Survey.fromJson(json['newSurvey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurveyCreateResponseToJson(
        SurveyCreateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'newSurvey': instance.newSurvey,
    };
