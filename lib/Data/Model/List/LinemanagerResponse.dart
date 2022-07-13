

import 'package:json_annotation/json_annotation.dart';

import 'Linemanager.dart';


part 'LinemanagerResponse.g.dart';

@JsonSerializable()
class SecResponse{

  bool? success;
  int? length;
  List<Seclist>? linemanager;


  SecResponse(this.success, this.length, this.linemanager);

  factory SecResponse.fromJson(Map<String,dynamic>json)=>
      _$SecResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SecResponseToJson(this);
}