// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoadAllProducts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadAllProducts _$LoadAllProductsFromJson(Map<String, dynamic> json) =>
    LoadAllProducts(
      json['status'] as String?,
      json['length'] as int?,
      (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoadAllProductsToJson(LoadAllProducts instance) =>
    <String, dynamic>{
      'status': instance.status,
      'length': instance.length,
      'product': instance.product,
    };
