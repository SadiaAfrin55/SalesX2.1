// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainingActivityAttendanceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingActivityAttendanceResponse _$TrainingActivityAttendanceResponseFromJson(
        Map<String, dynamic> json) =>
    TrainingActivityAttendanceResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['attendance'] as List<dynamic>?)
          ?.map((e) =>
              TrainingActivityAttendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainingActivityAttendanceResponseToJson(
        TrainingActivityAttendanceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'attendance': instance.attendance,
    };
