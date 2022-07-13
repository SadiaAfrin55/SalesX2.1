// ignore: file_names

import 'package:json_annotation/json_annotation.dart';


part 'visitShopInfo.g.dart';

@JsonSerializable()
class visitShop{
  //@JsonKey(name: "_id")
  String? storename;
  String? storedmscode;
  String? storetype;
  String? holiday;
  String? location;
  String? area;


  visitShop(this.storename, this.storedmscode, this.storetype, this.holiday,
      this.location, this.area);

  factory visitShop.fromJson(Map<String,dynamic>json)=>
      _$visitShopFromJson(json);
  Map<String,dynamic>toJson()=>_$visitShopToJson(this);
}