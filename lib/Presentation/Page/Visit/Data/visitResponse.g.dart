// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

visitResponse _$visitResponseFromJson(Map<String, dynamic> json) =>
    visitResponse(
      json['status'] as String?,
      json['length'] as int?,
      (json['allVisited'] as List<dynamic>?)
          ?.map((e) => visit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$visitResponseToJson(visitResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'allVisited': instance.allVisited,
    };
