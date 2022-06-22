// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveResponse _$LeaveResponseFromJson(Map<String, dynamic> json) =>
    LeaveResponse(
      status: json['status'] as String?,
      length: json['length'] as int?,
      leaveform: (json['leave'] as List<dynamic>?)
          ?.map((e) => Leave.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaveResponseToJson(LeaveResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'leave': instance.leaveform,
    };
