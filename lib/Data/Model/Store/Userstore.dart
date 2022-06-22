
import 'package:json_annotation/json_annotation.dart';

import 'Store.dart';


part 'Userstore.g.dart';

@JsonSerializable()
class Userstore{
  List<Store>? store;
  Userstore( this.store);

  factory Userstore.fromJson(Map<String,dynamic>json)=>
      _$UserstoreFromJson(json);
  Map<String,dynamic>toJson()=>_$UserstoreToJson(this);
}