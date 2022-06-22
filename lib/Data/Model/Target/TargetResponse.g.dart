// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TargetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetResponse _$TargetResponseFromJson(Map<String, dynamic> json) =>
    TargetResponse(
      json['status'] as String?,
      json['target'] == null
          ? null
          : Target.fromJson(json['target'] as Map<String, dynamic>),
      json['todayTarget'] as int?,
      json['todayAchive'] as int?,
      json['YestardayTarget'] as int?,
      json['YestardayAchive'] as int?,
      json['lastsevendayTarget'] as int?,
      json['lastsevendayAchive'] as int?,
    );

Map<String, dynamic> _$TargetResponseToJson(TargetResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'target': instance.target,
      'todayTarget': instance.todayTarget,
      'todayAchive': instance.todayAchive,
      'YestardayTarget': instance.YestardayTarget,
      'YestardayAchive': instance.YestardayAchive,
      'lastsevendayTarget': instance.lastsevendayTarget,
      'lastsevendayAchive': instance.lastsevendayAchive,
    };
