
import 'package:json_annotation/json_annotation.dart';


part 'survey.g.dart';

@JsonSerializable()
class SecSurvey{

  int? sales;
  String? customername;
  String? dataIn;
  String? interestedin;
  String? customercontactno;
  String? customerage;
  String? customeremail;
  String? customerbudget;
  String? pricerange;


  SecSurvey(
      this.sales,
      this.customername,
      this.dataIn,
      this.interestedin,
      this.customercontactno,
      this.customerage,
      this.customeremail,
      this.customerbudget,
      this.pricerange);

  factory SecSurvey.fromJson(Map<String,dynamic>json)=>
      _$SecSurveyFromJson(json);
  Map<String,dynamic>toJson()=>_$SecSurveyToJson(this);
}