// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoeAttendanceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoeAttendanceResponse _$FoeAttendanceResponseFromJson(
        Map<String, dynamic> json) =>
    FoeAttendanceResponse(
      json['success'] as bool?,
      (json['attendance'] as List<dynamic>?)
          ?.map((e) => FoeAttendances.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoeAttendanceResponseToJson(
        FoeAttendanceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
