// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecSurvey _$SecSurveyFromJson(Map<String, dynamic> json) => SecSurvey(
      json['sales'] as int?,
      json['customername'] as String?,
      json['dataIn'] as String?,
      json['interestedin'] as String?,
      json['customercontactno'] as String?,
      json['customerage'] as String?,
      json['customeremail'] as String?,
      json['customerbudget'] as String?,
      json['pricerange'] as String?,
    );

Map<String, dynamic> _$SecSurveyToJson(SecSurvey instance) => <String, dynamic>{
      'sales': instance.sales,
      'customername': instance.customername,
      'dataIn': instance.dataIn,
      'interestedin': instance.interestedin,
      'customercontactno': instance.customercontactno,
      'customerage': instance.customerage,
      'customeremail': instance.customeremail,
      'customerbudget': instance.customerbudget,
      'pricerange': instance.pricerange,
    };
