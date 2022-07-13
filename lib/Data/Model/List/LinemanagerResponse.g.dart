// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LinemanagerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecResponse _$SecResponseFromJson(Map<String, dynamic> json) => SecResponse(
      json['success'] as bool?,
      json['length'] as int?,
      (json['linemanager'] as List<dynamic>?)
          ?.map((e) => Seclist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SecResponseToJson(SecResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'length': instance.length,
      'linemanager': instance.linemanager,
    };
