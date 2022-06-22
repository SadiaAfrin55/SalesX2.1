

import 'package:json_annotation/json_annotation.dart';

import 'Product.dart';

part 'LoadAllProducts.g.dart';

@JsonSerializable()
class LoadAllProducts{

  final String? status;
  final int? length;
  final List<Product>? product;


  LoadAllProducts(this.status, this.length, this.product);

  factory LoadAllProducts.fromJson(Map<String,dynamic>json)=>
      _$LoadAllProductsFromJson(json);
  Map<String,dynamic>toJson()=>_$LoadAllProductsToJson(this);
}