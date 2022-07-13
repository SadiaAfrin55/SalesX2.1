// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

store _$storeFromJson(Map<String, dynamic> json) => store(
      json['_id'] as String?,
      json['storename'] as String?,
      json['storedmscode'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$storeToJson(store instance) => <String, dynamic>{
      '_id': instance.id,
      'storename': instance.storename,
      'storedmscode': instance.storedmscode,
      'createdAt': instance.createdAt,
    };
