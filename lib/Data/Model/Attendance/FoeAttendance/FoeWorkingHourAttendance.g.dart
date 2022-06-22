// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoeWorkingHourAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoeWorkingHourAttendance _$FoeWorkingHourAttendanceFromJson(
        Map<String, dynamic> json) =>
    FoeWorkingHourAttendance(
      json['photo'] as String?,
      json['intime'] as String?,
      json['outtime'] as String?,
      json['userId'] as String?,
      json['workingtime'] as String?,
    );

Map<String, dynamic> _$FoeWorkingHourAttendanceToJson(
        FoeWorkingHourAttendance instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'intime': instance.intime,
      'outtime': instance.outtime,
      'userId': instance.userId,
      'workingtime': instance.workingtime,
    };
