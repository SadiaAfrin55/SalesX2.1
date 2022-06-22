// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InventroyCreateResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventroyCreateResponse _$InventroyCreateResponseFromJson(
        Map<String, dynamic> json) =>
    InventroyCreateResponse(
      json['status'] as String?,
      json['newInventory'] == null
          ? null
          : Inventory.fromJson(json['newInventory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InventroyCreateResponseToJson(
        InventroyCreateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'newInventory': instance.newInventory,
    };
