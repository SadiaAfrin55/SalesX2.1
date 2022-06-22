
import 'package:json_annotation/json_annotation.dart';


part 'Sale.g.dart';

@JsonSerializable()
class Sale{

  @JsonKey(name: "_id")
  String? id;
  String? storename;
  String? username;
  String? userId;
  String? managerId;
  String? date;
  String? customername;
  String? customeremail;
  String? customermobile;
  int? quatity;
  String? color;
  String? price;
  String? age;
  String? productName;
  String? product;
  String? remark;
  String? createdAt;


  Sale(
      this.id,
      this.storename,
      this.username,
      this.userId,
      this.managerId,
      this.date,
      this.customername,
      this.customeremail,
      this.customermobile,
      this.quatity,
      this.color,
      this.price,
      this.age,
      this.productName,
      this.product,
      this.remark,
      this.createdAt
      );

  factory Sale.fromJson(Map<String,dynamic>json)=>
      _$SaleFromJson(json);
  Map<String,dynamic>toJson()=>_$SaleToJson(this);
}