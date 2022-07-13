
import 'package:json_annotation/json_annotation.dart';

import 'SaleChart.dart';


part 'SaleChartResponse.g.dart';

@JsonSerializable()
class SaleChartResponse{


  String? message;
  List<SaleChart>? object;


  SaleChartResponse(this.message, this.object);

  factory SaleChartResponse.fromJson(Map<String,dynamic>json)=>
      _$SaleChartResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SaleChartResponseToJson(this);
}