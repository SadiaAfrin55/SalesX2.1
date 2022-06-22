// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StoreGetResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreGetResponse _$StoreGetResponseFromJson(Map<String, dynamic> json) =>
    StoreGetResponse(
      json['status'] as String,
      json['length'] as int?,
      (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreGetResponseToJson(StoreGetResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'stores': instance.stores,
    };
