// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

storeResponse _$storeResponseFromJson(Map<String, dynamic> json) =>
    storeResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['stores'] as List<dynamic>?)
          ?.map((e) => store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$storeResponseToJson(storeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'stores': instance.stores,
    };
