// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['_id'] as String?,
      json['productName'] as String?,
      json['month'] as String?,
      json['businessUnit'] as String?,
      json['year'] as String?,
      json['category'] as String?,
      json['subcategory'] as String?,
      json['recomendedprice'] as String?,
      json['maxRetailPrice'] as String?,
      json['promoprice'] as String?,
      json['emitenure'] as String?,
      json['devicevariant'] as String?,
      json['color'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'productName': instance.productName,
      'month': instance.month,
      'businessUnit': instance.businessUnit,
      'year': instance.year,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'recomendedprice': instance.recomendedprice,
      'maxRetailPrice': instance.maxRetailPrice,
      'promoprice': instance.promoprice,
      'emitenure': instance.emitenure,
      'devicevariant': instance.devicevariant,
      'color': instance.color,
    };
