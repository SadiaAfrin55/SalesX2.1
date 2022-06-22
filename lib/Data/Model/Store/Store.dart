
import 'package:json_annotation/json_annotation.dart';


part 'Store.g.dart';

@JsonSerializable()
class Store{
  @JsonKey(name: "_id")
  String? id;

  String? storename;
  String? storedmscode;
  String? storetype;
  String? holiday;
  String? location;
  String? teritory;
  String? area;
  String? district;
  String? division;
  String? lat;
  String? lon;
  String? cutofftime;
  String? status;

  Store(
      this.id,
      this.storename,
      this.storedmscode,
      this.storetype,
      this.holiday,
      this.location,
      this.teritory,
      this.area,
      this.district,
      this.division,
      this.lat,
      this.lon,
      this.cutofftime,
      this.status);
  @override
  String toString() {
    return '${id} ${storename}'.toLowerCase() + ' ${id} ${storename}'.toUpperCase();
  }
  factory Store.fromJson(Map<String,dynamic>json)=>
      _$StoreFromJson(json);
  Map<String,dynamic>toJson()=>_$StoreToJson(this);



}