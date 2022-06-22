// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      json['_id'] as String?,
      json['storename'] as String?,
      json['storedmscode'] as String?,
      json['storetype'] as String?,
      json['holiday'] as String?,
      json['location'] as String?,
      json['teritory'] as String?,
      json['area'] as String?,
      json['district'] as String?,
      json['division'] as String?,
      json['lat'] as String?,
      json['lon'] as String?,
      json['cutofftime'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      '_id': instance.id,
      'storename': instance.storename,
      'storedmscode': instance.storedmscode,
      'storetype': instance.storetype,
      'holiday': instance.holiday,
      'location': instance.location,
      'teritory': instance.teritory,
      'area': instance.area,
      'district': instance.district,
      'division': instance.division,
      'lat': instance.lat,
      'lon': instance.lon,
      'cutofftime': instance.cutofftime,
      'status': instance.status,
    };
