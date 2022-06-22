// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoeAttendanceByDateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoeAttendanceByDateResponse _$FoeAttendanceByDateResponseFromJson(
        Map<String, dynamic> json) =>
    FoeAttendanceByDateResponse(
      json['success'] as bool?,
      json['attendance'] == null
          ? null
          : FoeAttendances.fromJson(json['attendance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoeAttendanceByDateResponseToJson(
        FoeAttendanceByDateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
