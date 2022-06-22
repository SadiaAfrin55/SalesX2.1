

import 'package:json_annotation/json_annotation.dart';

import 'Product.dart';

part 'Inventory.g.dart';

@JsonSerializable()
class Inventory{


  int? quantity;
  Product? product;


  Inventory( this.quantity, this.product);

  factory Inventory.fromJson(Map<String,dynamic>json)=>
      _$InventoryFromJson(json);
  Map<String,dynamic>toJson()=>_$InventoryToJson(this);
}