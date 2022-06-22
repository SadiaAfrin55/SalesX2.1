// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveCreateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveCreateResponse _$LeaveCreateResponseFromJson(Map<String, dynamic> json) =>
    LeaveCreateResponse(
      json['status'] as String?,
      json['newleaveform'] == null
          ? null
          : Leave.fromJson(json['newleaveform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveCreateResponseToJson(
        LeaveCreateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'newleaveform': instance.newleaveform,
    };
