// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaleResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleResponse _$SaleResponseFromJson(Map<String, dynamic> json) => SaleResponse(
      json['status'] as String?,
      json['lenght'] as int?,
      (json['sales'] as List<dynamic>?)
          ?.map((e) => Sale.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleResponseToJson(SaleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lenght': instance.lenght,
      'sales': instance.sales,
    };
