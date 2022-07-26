
import 'package:json_annotation/json_annotation.dart';

part 'MorningAtd.g.dart';

@JsonSerializable()
class MorningAtd{

  bool? isLate;
  String? photo;
  String? intime;
  String? store;
  String? morningremarks;


  MorningAtd(
      this.isLate, this.photo, this.intime, this.store, this.morningremarks);

  factory MorningAtd.fromJson(Map<String,dynamic>json)=>
      _$MorningAtdFromJson(json);
  Map<String,dynamic>toJson()=>_$MorningAtdToJson(this);
}