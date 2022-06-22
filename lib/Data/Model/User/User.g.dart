// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String?,
      json['email'] as String?,
      json['businessunit'] as String?,
      json['role'] as String?,
      json['workingstatus'] as String?,
      json['_id'] as String?,
      json['employeeId'] as String?,
      json['mobileno'] as String?,
      json['target'] as int?,
      json['sales'] as int?,
      json['targetAchive'] as int?,
      json['stores'] == null
          ? null
          : Userstore.fromJson(json['stores'] as Map<String, dynamic>),
      json['linemanagerid'] as String?,
      json['supermanegerid'] as String?,
      json['toplevelmanagerid'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'stores': instance.stores,
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
