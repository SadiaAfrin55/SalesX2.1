// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmAttendanceByDateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmAttendanceByDateResponse _$VmAttendanceByDateResponseFromJson(
        Map<String, dynamic> json) =>
    VmAttendanceByDateResponse(
      json['success'] as bool?,
      (json['attendance'] as List<dynamic>?)
          ?.map((e) => VmAttendances.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VmAttendanceByDateResponseToJson(
        VmAttendanceByDateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
