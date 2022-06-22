// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
      json['_id'] as String?,
      json['storename'] as String?,
      json['username'] as String?,
      json['userId'] as String?,
      json['managerId'] as String?,
      json['date'] as String?,
      json['customername'] as String?,
      json['customeremail'] as String?,
      json['customermobile'] as String?,
      json['quatity'] as int?,
      json['color'] as String?,
      json['price'] as String?,
      json['age'] as String?,
      json['productName'] as String?,
      json['product'] as String?,
      json['remark'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      '_id': instance.id,
      'storename': instance.storename,
      'username': instance.username,
      'userId': instance.userId,
      'managerId': instance.managerId,
      'date': instance.date,
      'customername': instance.customername,
      'customeremail': instance.customeremail,
      'customermobile': instance.customermobile,
      'quatity': instance.quatity,
      'color': instance.color,
      'price': instance.price,
      'age': instance.age,
      'productName': instance.productName,
      'product': instance.product,
      'remark': instance.remark,
      'createdAt': instance.createdAt,
    };
