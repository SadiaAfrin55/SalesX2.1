// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmAttendanceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmAttendanceResponse _$VmAttendanceResponseFromJson(
        Map<String, dynamic> json) =>
    VmAttendanceResponse(
      json['success'] as bool?,
      (json['attendance'] as List<dynamic>?)
          ?.map((e) => VmAttendances.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VmAttendanceResponseToJson(
        VmAttendanceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
