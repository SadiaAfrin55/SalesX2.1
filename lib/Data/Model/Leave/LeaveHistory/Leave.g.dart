// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => Leave(
      json['_id'] as String?,
      json['date'] as String?,
      json['reason'] as String?,
      json['leaveformat'] as String?,
      json['acceptence'] as String?,
      json['user'] as String?,
      json['linemanager'] as String?,
      json['username'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'reason': instance.reason,
      'leaveformat': instance.leaveformat,
      'acceptence': instance.acceptence,
      'user': instance.user,
      'linemanager': instance.linemanager,
      'username': instance.username,
      'createdAt': instance.createdAt,
    };
