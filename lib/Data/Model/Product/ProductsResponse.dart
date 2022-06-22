
import 'package:json_annotation/json_annotation.dart';

import 'Products.dart';

part 'ProductsResponse.g.dart';

@JsonSerializable()
class ProductsResponse{

  String? status;
  Products? products;


  ProductsResponse(this.status, this.products);

  factory ProductsResponse.fromJson(Map<String,dynamic>json)=>
      _$ProductsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$ProductsResponseToJson(this);
}