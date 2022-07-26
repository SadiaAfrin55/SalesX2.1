// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vmWorkinghourAtd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

vmWorkinghour _$vmWorkinghourFromJson(Map<String, dynamic> json) =>
    vmWorkinghour(
      json['photo'] as String,
      json['userId'] as String,
      json['intime'] as String,
      json['outtime'] as String,
      json['workingtime'] as String,
    );

Map<String, dynamic> _$vmWorkinghourToJson(vmWorkinghour instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'userId': instance.userId,
      'intime': instance.intime,
      'outtime': instance.outtime,
      'workingtime': instance.workingtime,
    };
