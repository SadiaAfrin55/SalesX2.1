// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vmSignoffAtd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

vmSignoff _$vmSignoffFromJson(Map<String, dynamic> json) => vmSignoff(
      json['photo'] as String,
      json['outTime'] as String,
      json['lat'] as String,
      json['lon'] as String,
      json['note'] as String,
    );

Map<String, dynamic> _$vmSignoffToJson(vmSignoff instance) => <String, dynamic>{
      'photo': instance.photo,
      'outTime': instance.outTime,
      'lat': instance.lat,
      'lon': instance.lon,
      'note': instance.note,
    };
