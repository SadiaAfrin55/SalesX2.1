// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmWorkingHourAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmWorkingHourAttendance _$VmWorkingHourAttendanceFromJson(
        Map<String, dynamic> json) =>
    VmWorkingHourAttendance(
      json['photo'] as String?,
      json['intime'] as String?,
      json['outtime'] as String?,
      json['userId'] as String?,
      json['workingtime'] as String?,
    );

Map<String, dynamic> _$VmWorkingHourAttendanceToJson(
        VmWorkingHourAttendance instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'intime': instance.intime,
      'outtime': instance.outtime,
      'userId': instance.userId,
      'workingtime': instance.workingtime,
    };
