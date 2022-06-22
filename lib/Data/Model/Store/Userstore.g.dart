// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Userstore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userstore _$UserstoreFromJson(Map<String, dynamic> json) => Userstore(
      (json['store'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserstoreToJson(Userstore instance) => <String, dynamic>{
      'store': instance.store,
    };
