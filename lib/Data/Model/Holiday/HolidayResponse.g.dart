// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HolidayResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayResponse _$HolidayResponseFromJson(Map<String, dynamic> json) =>
    HolidayResponse(
      json['success'] as String,
      json['holiday'] as String,
    );

Map<String, dynamic> _$HolidayResponseToJson(HolidayResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'holiday': instance.holiday,
    };
