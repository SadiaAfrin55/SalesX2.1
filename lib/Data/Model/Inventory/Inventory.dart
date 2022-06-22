
import 'package:json_annotation/json_annotation.dart';

part 'Inventory.g.dart';

@JsonSerializable()
class Inventory{
  String? devicemodel;
  String? quantity;
  String? remarks;

  Inventory({this.devicemodel, this.quantity, this.remarks});

  factory Inventory.fromJson(Map<String,dynamic>json)=>
      _$InventoryFromJson(json);
  Map<String,dynamic>toJson()=>_$InventoryToJson(this);
}