// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['noticeBoardForm'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'noticeBoardForm': instance.noticeBoardForm,
    };
