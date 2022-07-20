// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveResponseByMonth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveResponseByMonth _$LeaveResponseByMonthFromJson(
        Map<String, dynamic> json) =>
    LeaveResponseByMonth(
      status: json['status'] as String?,
      length: json['length'] as int?,
      leaveform: (json['leave'] as List<dynamic>?)
          ?.map((e) => Leave.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaveResponseByMonthToJson(
        LeaveResponseByMonth instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'leave': instance.leaveform,
    };
