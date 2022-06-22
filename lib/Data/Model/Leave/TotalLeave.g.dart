// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TotalLeave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalLeave _$TotalLeaveFromJson(Map<String, dynamic> json) => TotalLeave(
      json['status'] as String,
      json['casualleave'] as int?,
      json['sickleave'] as int?,
    );

Map<String, dynamic> _$TotalLeaveToJson(TotalLeave instance) =>
    <String, dynamic>{
      'status': instance.status,
      'casualleave': instance.casualleave,
      'sickleave': instance.sickleave,
    };
