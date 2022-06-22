// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmAttendanceByDateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmAttendanceByDateResponse _$VmAttendanceByDateResponseFromJson(
        Map<String, dynamic> json) =>
    VmAttendanceByDateResponse(
      json['success'] as bool?,
      json['attendance'] == null
          ? null
          : VmAttendances.fromJson(json['attendance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VmAttendanceByDateResponseToJson(
        VmAttendanceByDateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
