// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoeAttendances.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoeAttendances _$FoeAttendancesFromJson(Map<String, dynamic> json) =>
    FoeAttendances(
      json['_id'] as String?,
      json['userId'] as String?,
      json['businessunit'] as String?,
      json['LinemanagerId'] as String?,
      json['dateid'] as String?,
      json['month'] as String?,
      VmSignOffAttendance.fromJson(json['signoffAtd'] as Map<String, dynamic>),
      VmWorkingHourAttendance.fromJson(
          json['workinghour'] as Map<String, dynamic>),
      (json['storeAttendance'] as List<dynamic>)
          .map((e) => VmStoreAttendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoeAttendancesToJson(FoeAttendances instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'businessunit': instance.businessunit,
      'LinemanagerId': instance.LinemanagerId,
      'dateid': instance.dateid,
      'month': instance.month,
      'signoffAtd': instance.signoffAtd,
      'workinghour': instance.workinghour,
      'storeAttendance': instance.storeAttendance,
    };
