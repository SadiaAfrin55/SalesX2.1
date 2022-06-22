// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey _$SurveyFromJson(Map<String, dynamic> json) => Survey(
      json['customername'] as String?,
      json['userId'] as String?,
      json['date'] as String?,
      json['dataIn'] as String?,
      json['customeremail'] as String?,
      json['customercontactno'] as String?,
      json['customerage'] as String?,
      json['interestedin'] as String?,
      json['customerbudget'] as String?,
      json['customercurrentphone'] as String?,
      json['pricerange'] as String?,
      json['linemanagerid'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['_id'] as String?,
    );

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'customername': instance.customername,
      'userId': instance.userId,
      'date': instance.date,
      'dataIn': instance.dataIn,
      'customeremail': instance.customeremail,
      'customercontactno': instance.customercontactno,
      'customerage': instance.customerage,
      'interestedin': instance.interestedin,
      'customerbudget': instance.customerbudget,
      'customercurrentphone': instance.customercurrentphone,
      'pricerange': instance.pricerange,
      'linemanagerid': instance.linemanagerid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '_id': instance.id,
    };
