// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceTwo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceTwo _$AttendanceTwoFromJson(Map<String, dynamic> json) =>
    AttendanceTwo(
      json['_id'] as String?,
      json['userId'] == null
          ? null
          : UserTwo.fromJson(json['userId'] as Map<String, dynamic>),
      json['businessunit'] as String?,
      json['role'] as String?,
      json['dateid'] as String?,
      json['month'] as String?,
      json['morningAtd'] == null
          ? null
          : MorningAtd.fromJson(json['morningAtd'] as Map<String, dynamic>),
      json['eveningAtd'] == null
          ? null
          : EveingAtd.fromJson(json['eveningAtd'] as Map<String, dynamic>),
      json['signoffAtd'] == null
          ? null
          : SignoffAtd.fromJson(json['signoffAtd'] as Map<String, dynamic>),
      json['workinghour'] == null
          ? null
          : WorkingHours.fromJson(json['workinghour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttendanceTwoToJson(AttendanceTwo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'businessunit': instance.businessunit,
      'role': instance.role,
      'dateid': instance.dateid,
      'month': instance.month,
      'morningAtd': instance.morningAtd,
      'eveningAtd': instance.eveningAtd,
      'signoffAtd': instance.signoffAtd,
      'workinghour': instance.workinghour,
    };
