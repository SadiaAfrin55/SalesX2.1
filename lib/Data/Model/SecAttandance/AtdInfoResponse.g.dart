// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AtdInfoResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AtdInfoResponse _$AtdInfoResponseFromJson(Map<String, dynamic> json) =>
    AtdInfoResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['objectarr'] as List<dynamic>?)
          ?.map((e) => AtdInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AtdInfoResponseToJson(AtdInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'objectarr': instance.objectarr,
    };
