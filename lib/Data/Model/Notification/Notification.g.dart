// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      json['_id'] as String,
      json['dateid'] as String?,
      json['users'] as String?,
      json['role'] as String?,
      json['noticefor'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dateid': instance.dateid,
      'users': instance.users,
      'role': instance.role,
      'noticefor': instance.noticefor,
      'description': instance.description,
    };
