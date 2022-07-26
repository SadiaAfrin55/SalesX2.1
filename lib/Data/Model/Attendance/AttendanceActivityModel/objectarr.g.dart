// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectarr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

attendanceObject _$attendanceObjectFromJson(Map<String, dynamic> json) =>
    attendanceObject(
      json['normalintime'] as String,
      json['outtime'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$attendanceObjectToJson(attendanceObject instance) =>
    <String, dynamic>{
      'normalintime': instance.normalintime,
      'outtime': instance.outtime,
      'name': instance.name,
    };
