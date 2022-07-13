// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Data/visitShopInfo.dart';


part 'visit.g.dart';

@JsonSerializable()
class visit{
  //@JsonKey(name: "_id")
  String? time;
  String? dateString;
  String? photourl;
  visitShop? shopid;


  visit(this.time, this.dateString, this.photourl, this.shopid);

  factory visit.fromJson(Map<String,dynamic>json)=>
      _$visitFromJson(json);
  Map<String,dynamic>toJson()=>_$visitToJson(this);
}