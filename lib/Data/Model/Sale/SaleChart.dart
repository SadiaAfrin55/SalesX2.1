
import 'package:json_annotation/json_annotation.dart';



part 'SaleChart.g.dart';

@JsonSerializable()
class SaleChart{


  String? month;
  int? totalunit;
  int? saleamount;


  SaleChart(this.month, this.totalunit, this.saleamount);

  factory SaleChart.fromJson(Map<String,dynamic>json)=>
      _$SaleChartFromJson(json);
  Map<String,dynamic>toJson()=>_$SaleChartToJson(this);
}