
import 'package:json_annotation/json_annotation.dart';


part 'Linemanager.g.dart';

@JsonSerializable()
class Seclist{
  @JsonKey(name: "_id")
  String? id;
  int? sales;
  String? name;
  String? email;
  String? employeeId;
  String? officemail;
  String? area;
  String? teritory;
  String? mobileno;
  String? createdAt;
  int? target;
  int? targetAchive;


  Seclist(
      this.id,
      this.sales,
      this.name,
      this.email,
      this.employeeId,
      this.officemail,
      this.area,
      this.teritory,
      this.mobileno,
      this.createdAt,
      this.target,
      this.targetAchive);

  factory Seclist.fromJson(Map<String,dynamic>json)=>
      _$SeclistFromJson(json);
  Map<String,dynamic>toJson()=>_$SeclistToJson(this);
}