// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inventory _$InventoryFromJson(Map<String, dynamic> json) => Inventory(
      devicemodel: json['devicemodel'] as String?,
      quantity: json['quantity'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$InventoryToJson(Inventory instance) => <String, dynamic>{
      'devicemodel': instance.devicemodel,
      'quantity': instance.quantity,
      'remarks': instance.remarks,
    };
