

import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product{

  @JsonKey(name: "_id")
  String? id;
  String? productName;
  String? month;
  String? businessUnit;
  String? year;
  String? category;
  String? subcategory;
  String? recomendedprice;
  String? maxRetailPrice;
  String? promoprice;
  String? emitenure;
  String? devicevariant;
  String? color;


  Product(
      this.id,
      this.productName,
      this.month,
      this.businessUnit,
      this.year,
      this.category,
      this.subcategory,
      this.recomendedprice,
      this.maxRetailPrice,
      this.promoprice,
      this.emitenure,
      this.devicevariant,
      this.color);

  @override
  String toString() {
    return '${id} ${productName}'.toLowerCase() + ' ${id} ${productName}'.toUpperCase();
  }
  factory Product.fromJson(Map<String,dynamic>json)=>
      _$ProductFromJson(json);
  Map<String,dynamic>toJson()=>_$ProductToJson(this);


}