
import 'package:json_annotation/json_annotation.dart';

import 'Inventory.dart';

part 'InventroyCreateResponse.g.dart';

@JsonSerializable()
class InventroyCreateResponse{
  String? status;
  Inventory? newInventory;


  InventroyCreateResponse(this.status, this.newInventory);

  factory InventroyCreateResponse.fromJson(Map<String,dynamic>json)=>
      _$InventroyCreateResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$InventroyCreateResponseToJson(this);
}