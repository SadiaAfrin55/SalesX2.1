// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

visit _$visitFromJson(Map<String, dynamic> json) => visit(
      json['time'] as String?,
      json['dateString'] as String?,
      json['photourl'] as String?,
      json['shopid'] == null
          ? null
          : visitShop.fromJson(json['shopid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$visitToJson(visit instance) => <String, dynamic>{
      'time': instance.time,
      'dateString': instance.dateString,
      'photourl': instance.photourl,
      'shopid': instance.shopid,
    };
