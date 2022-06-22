// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserTwo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTwo _$UserTwoFromJson(Map<String, dynamic> json) => UserTwo(
      json['name'] as String,
      json['email'] as String,
      json['businessunit'] as String,
      json['role'] as String,
      json['workingstatus'] as String,
      json['_id'] as String,
      json['employeeId'] as String,
      json['mobileno'] as String,
      json['target'] as int,
      json['sales'] as int,
      json['targetAchive'] as int,
      json['linemanagerid'] as String,
      json['supermanegerid'] as String,
      json['toplevelmanagerid'] as String,
    );

Map<String, dynamic> _$UserTwoToJson(UserTwo instance) => <String, dynamic>{
      'businessunit': instance.businessunit,
      'sales': instance.sales,
      'targetAchive': instance.targetAchive,
      'role': instance.role,
      'workingstatus': instance.workingstatus,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'employeeId': instance.employeeId,
      'target': instance.target,
      'supermanegerid': instance.supermanegerid,
      'linemanagerid': instance.linemanagerid,
      'toplevelmanagerid': instance.toplevelmanagerid,
      'mobileno': instance.mobileno,
    };
