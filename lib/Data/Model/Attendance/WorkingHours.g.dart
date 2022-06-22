// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkingHours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingHours _$WorkingHoursFromJson(Map<String, dynamic> json) => WorkingHours(
      json['photo'] as String?,
      json['userId'] as String?,
      json['intime'] as String?,
      json['outtime'] as String?,
      json['workingtime'] as String?,
    );

Map<String, dynamic> _$WorkingHoursToJson(WorkingHours instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'userId': instance.userId,
      'intime': instance.intime,
      'outtime': instance.outtime,
      'workingtime': instance.workingtime,
    };
