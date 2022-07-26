// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

vmAttendance _$vmAttendanceFromJson(Map<String, dynamic> json) => vmAttendance(
      json['_id'] as String?,
      json['userId'] as String,
      json['LinemanagerId'] as String,
      json['businessunit'] as String,
      json['dateid'] as String,
      json['month'] as String,
      json['role'] as String,
      vmSignoff.fromJson(json['signoffAtd'] as Map<String, dynamic>),
      vmWorkinghour.fromJson(json['workinghour'] as Map<String, dynamic>),
      (json['storeAttendance'] as List<dynamic>)
          .map((e) => vmStoreAtd.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$vmAttendanceToJson(vmAttendance instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'LinemanagerId': instance.LinemanagerId,
      'businessunit': instance.businessunit,
      'dateid': instance.dateid,
      'month': instance.month,
      'role': instance.role,
      'signoffAtd': instance.signoffAtd,
      'workinghour': instance.workinghour,
      'storeAttendance': instance.storeAttendance,
    };
