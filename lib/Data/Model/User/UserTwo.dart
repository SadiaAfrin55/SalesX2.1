
import 'package:json_annotation/json_annotation.dart';


part 'UserTwo.g.dart';

@JsonSerializable()
class UserTwo{

  String businessunit;
  int sales;
  int targetAchive;
  String role;
  String workingstatus;
  @JsonKey(name: "_id")
  String id;
  String name;
  String email;
  String employeeId;
  int target;
  String supermanegerid;
  String linemanagerid;
  String toplevelmanagerid;
  String mobileno;

  UserTwo(
      this.name,
      this.email,
      this.businessunit,
      this.role,
      this.workingstatus,
      this.id,
      this.employeeId,
      this.mobileno,
      this.target,
      this.sales,
      this.targetAchive,
      this.linemanagerid,
      this.supermanegerid,
      this.toplevelmanagerid);

  factory UserTwo.fromJson(Map<String,dynamic>json)=>
      _$UserTwoFromJson(json);
  Map<String,dynamic>toJson()=>_$UserTwoToJson(this);

}