


import 'package:json_annotation/json_annotation.dart';

import 'Inventory.dart';


part 'Products.g.dart';

@JsonSerializable()
class Products{

  @JsonKey(name: "_id")
  String? id;

   List<Inventory>?inventory;


  Products(this.id, this.inventory);

  factory Products.fromJson(Map<String,dynamic>json)=>
      _$ProductsFromJson(json);
  Map<String,dynamic>toJson()=>_$ProductsToJson(this);
}