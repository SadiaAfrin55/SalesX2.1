// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VmStoreAttendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VmStoreAttendance _$VmStoreAttendanceFromJson(Map<String, dynamic> json) =>
    VmStoreAttendance(
      json['photo'] as String?,
      json['storeName'] as String?,
      json['store'] as String?,
      json['intime'] as String?,
      json['userId'] as String?,
      json['note'] as String?,
    );

Map<String, dynamic> _$VmStoreAttendanceToJson(VmStoreAttendance instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'storeName': instance.storeName,
      'store': instance.store,
      'intime': instance.intime,
      'userId': instance.userId,
      'note': instance.note,
    };
