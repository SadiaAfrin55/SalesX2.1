// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoeStoreAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoeStoreAttendance _$FoeStoreAttendanceFromJson(Map<String, dynamic> json) =>
    FoeStoreAttendance(
      json['photo'] as String?,
      json['storeName'] as String?,
      json['store'] as String?,
      json['intime'] as String?,
      json['userId'] as String?,
      json['note'] as String?,
    );

Map<String, dynamic> _$FoeStoreAttendanceToJson(FoeStoreAttendance instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'storeName': instance.storeName,
      'store': instance.store,
      'intime': instance.intime,
      'userId': instance.userId,
      'note': instance.note,
    };
