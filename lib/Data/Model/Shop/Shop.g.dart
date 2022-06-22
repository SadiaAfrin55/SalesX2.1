// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      json['_id'] as String?,
      json['name'] as String?,
      json['shopCode'] as String?,
      json['route'] as String?,
      json['org'] as String?,
      json['ownerName'] as String?,
      json['phoneNumber'] as String?,
      json['image'] as String?,
      json['lat'] as String?,
      json['lon'] as String?,
      json['active'] as bool?,
      json['verify'] as bool?,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'shopCode': instance.shopCode,
      'route': instance.route,
      'org': instance.org,
      'ownerName': instance.ownerName,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'lat': instance.lat,
      'lon': instance.lon,
      'active': instance.active,
      'verify': instance.verify,
    };
