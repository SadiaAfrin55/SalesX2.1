// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StoreInactiveResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreInactiveResponse _$StoreInactiveResponseFromJson(
        Map<String, dynamic> json) =>
    StoreInactiveResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreInactiveResponseToJson(
        StoreInactiveResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'stores': instance.stores,
    };
