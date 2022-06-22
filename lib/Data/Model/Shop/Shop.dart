// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
part 'Shop.g.dart';

@JsonSerializable()
class Shop{

  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? shopCode;
  String? route;
  String? org;
  String? ownerName;
  String? phoneNumber;
  String? image;
  String? lat;
  String? lon;
  bool? active;
  bool? verify;


  Shop(
      this.id,
      this.name,
      this.shopCode,
      this.route,
      this.org,
      this.ownerName,
      this.phoneNumber,
      this.image,
      this.lat,
      this.lon,
      this.active,
      this.verify);

  factory Shop.fromJson(Map<String,dynamic>json)=>
      _$ShopFromJson(json);
  Map<String,dynamic>toJson()=>_$ShopToJson(this);
}