// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaleChartResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleChartResponse _$SaleChartResponseFromJson(Map<String, dynamic> json) =>
    SaleChartResponse(
      json['message'] as String?,
      (json['object'] as List<dynamic>?)
          ?.map((e) => SaleChart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleChartResponseToJson(SaleChartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'object': instance.object,
    };
