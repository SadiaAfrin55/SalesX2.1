// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceResponseTwo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponseTwo _$AttendanceResponseTwoFromJson(
        Map<String, dynamic> json) =>
    AttendanceResponseTwo(
      json['success'] as bool?,
      (json['attendance'] as List<dynamic>?)
          ?.map((e) => AttendanceTwo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceResponseTwoToJson(
        AttendanceResponseTwo instance) =>
    <String, dynamic>{
      'success': instance.success,
      'attendance': instance.attendance,
    };
