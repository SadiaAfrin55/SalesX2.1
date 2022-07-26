// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmAttendanceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

vmAttendanceResponse _$vmAttendanceResponseFromJson(
        Map<String, dynamic> json) =>
    vmAttendanceResponse(
      json['success'] as bool?,
      (json['attendance'] as List<dynamic>)
          .map((e) => vmAttendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$vmAttendanceResponseToJson(
        vmAttendanceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
