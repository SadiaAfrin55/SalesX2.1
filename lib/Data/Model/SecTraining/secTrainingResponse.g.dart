// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secTrainingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

secTrainingResponse _$secTrainingResponseFromJson(Map<String, dynamic> json) =>
    secTrainingResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['attendance'] as List<dynamic>?)
          ?.map((e) => secTraining.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$secTrainingResponseToJson(
        secTrainingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'attendance': instance.attendance,
    };
