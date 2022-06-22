// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MorningAtd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MorningAtd _$MorningAtdFromJson(Map<String, dynamic> json) => MorningAtd(
      json['isLate'] as bool?,
      json['photo'] as String?,
      json['intime'] as String?,
      json['store'] as String?,
      json['morningremarks'] as String?,
    );

Map<String, dynamic> _$MorningAtdToJson(MorningAtd instance) =>
    <String, dynamic>{
      'isLate': instance.isLate,
      'photo': instance.photo,
      'intime': instance.intime,
      'store': instance.store,
      'morningremarks': instance.morningremarks,
    };
