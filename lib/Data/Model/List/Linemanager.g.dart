// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Linemanager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seclist _$SeclistFromJson(Map<String, dynamic> json) => Seclist(
      json['_id'] as String?,
      json['sales'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['employeeId'] as String?,
      json['officemail'] as String?,
      json['area'] as String?,
      json['teritory'] as String?,
      json['mobileno'] as String?,
      json['createdAt'] as String?,
      json['target'] as int?,
      json['targetAchive'] as int?,
    );

Map<String, dynamic> _$SeclistToJson(Seclist instance) => <String, dynamic>{
      '_id': instance.id,
      'sales': instance.sales,
      'name': instance.name,
      'email': instance.email,
      'employeeId': instance.employeeId,
      'officemail': instance.officemail,
      'area': instance.area,
      'teritory': instance.teritory,
      'mobileno': instance.mobileno,
      'createdAt': instance.createdAt,
      'target': instance.target,
      'targetAchive': instance.targetAchive,
    };
