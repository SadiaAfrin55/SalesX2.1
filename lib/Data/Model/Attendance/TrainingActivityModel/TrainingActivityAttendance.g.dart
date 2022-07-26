// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainingActivityAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingActivityAttendance _$TrainingActivityAttendanceFromJson(
        Map<String, dynamic> json) =>
    TrainingActivityAttendance(
      json['_id'] as String,
      json['dateid'] as String,
      TrainingActivityAtd.fromJson(json['trainingAtd'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainingActivityAttendanceToJson(
        TrainingActivityAttendance instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dateid': instance.dateid,
      'trainingAtd': instance.trainingAtd,
    };
