import 'package:json_annotation/json_annotation.dart';
part 'Survey.g.dart';

@JsonSerializable()
class Survey{
  String? customername;
  String? userId;
  String? date;
  String? dataIn;
  String? customeremail;
  String? customercontactno;
  String? customerage;
  String? interestedin;
  String? customerbudget;
  String? customercurrentphone;
  String? pricerange;
  String? linemanagerid;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: "_id")
  String? id;


  Survey(
      this.customername,
      this.userId,
      this.date,
      this.dataIn,
      this.customeremail,
      this.customercontactno,
      this.customerage,
      this.interestedin,
      this.customerbudget,
      this.customercurrentphone,
      this.pricerange,
      this.linemanagerid,
      this.createdAt,
      this.updatedAt,
      this.id);

  factory Survey.fromJson(Map<String,dynamic>json)=>
      _$SurveyFromJson(json);
  Map<String,dynamic>toJson()=>_$SurveyToJson(this);

}