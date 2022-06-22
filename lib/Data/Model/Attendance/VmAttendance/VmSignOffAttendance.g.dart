// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmSignOffAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmSignOffAttendance _$VmSignOffAttendanceFromJson(Map<String, dynamic> json) =>
    VmSignOffAttendance(
      json['photo'] as String?,
      json['outTime'] as String?,
      json['userId'] as String?,
      json['note'] as String?,
    );

Map<String, dynamic> _$VmSignOffAttendanceToJson(
        VmSignOffAttendance instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'outTime': instance.outTime,
      'userId': instance.userId,
      'note': instance.note,
    };
