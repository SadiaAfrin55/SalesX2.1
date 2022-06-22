// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoeSignOffAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoeSignOffAttendance _$FoeSignOffAttendanceFromJson(
        Map<String, dynamic> json) =>
    FoeSignOffAttendance(
      json['photo'] as String?,
      json['outTime'] as String?,
      json['userId'] as String?,
      json['note'] as String?,
    );

Map<String, dynamic> _$FoeSignOffAttendanceToJson(
        FoeSignOffAttendance instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'outTime': instance.outTime,
      'userId': instance.userId,
      'note': instance.note,
    };
