
import 'package:json_annotation/json_annotation.dart';




part 'EveingAtd.g.dart';

@JsonSerializable()
class EveingAtd{


  String? photo;
  String? evetime;
  String?  userId;
  String? store;
  String? eveningremarks;


  EveingAtd(
      this.photo, this.evetime, this.userId, this.store, this.eveningremarks);

  factory EveingAtd.fromJson(Map<String,dynamic>json)=>
      _$EveingAtdFromJson(json);
  Map<String,dynamic>toJson()=>_$EveingAtdToJson(this);
}