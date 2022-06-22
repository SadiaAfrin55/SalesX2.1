// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../Store/Userstore.dart';
part 'User.g.dart';

@JsonSerializable()
class User{

  Userstore? stores;
  String? businessunit;
  int? sales;
  int? targetAchive;
  String? role;
  String? workingstatus;
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? email;
  String? employeeId;
  int? target;
  String? supermanegerid;
  String? linemanagerid;
  String? toplevelmanagerid;
  String? mobileno;

  User(
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
      this.stores,
      this.linemanagerid,
      this.supermanegerid,
      this.toplevelmanagerid);




  factory User.fromJson(Map<String,dynamic>json)=>
      _$UserFromJson(json);
  Map<String,dynamic>toJson()=>_$UserToJson(this);
}