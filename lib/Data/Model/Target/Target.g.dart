// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
      json['_id'] as String?,
      json['achiveTarget'] as int?,
      json['user'] as String?,
      json['actualTarget'] as int?,
      json['month'] as String?,
    );

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      '_id': instance.id,
      'achiveTarget': instance.achiveTarget,
      'user': instance.user,
      'actualTarget': instance.actualTarget,
      'month': instance.month,
    };
