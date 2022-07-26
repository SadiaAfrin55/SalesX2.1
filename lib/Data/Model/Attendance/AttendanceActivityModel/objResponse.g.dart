// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

attendanceObjectResponse _$attendanceObjectResponseFromJson(
        Map<String, dynamic> json) =>
    attendanceObjectResponse(
      json['status'] as String,
      json['length'] as int,
      (json['objectarr'] as List<dynamic>)
          .map((e) => attendanceObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$attendanceObjectResponseToJson(
        attendanceObjectResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'objectarr': instance.objectarr,
    };
