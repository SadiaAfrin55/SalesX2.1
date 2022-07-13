

import 'package:json_annotation/json_annotation.dart';

import 'Sale.dart';


part 'SaleResponse.g.dart';

@JsonSerializable()
class SaleResponse{

  String? status;
  int? length;
  List<Sale>? sales;


  SaleResponse(this.status, this.length, this.sales);

  factory SaleResponse.fromJson(Map<String,dynamic>json)=>
      _$SaleResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SaleResponseToJson(this);
}