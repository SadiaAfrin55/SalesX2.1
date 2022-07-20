
import 'package:json_annotation/json_annotation.dart';

part 'Leave.g.dart';

@JsonSerializable()
class Leave{

  @JsonKey(name: "_id")
  String? id;
  String? date;
  String? reason;
  String? leaveformat;
  String? acceptence;
  String? user;
  String? linemanager;
  String? username;
  String? createdAt;

  Leave(this.id, this.date, this.reason, this.leaveformat, this.acceptence,this.user,this.linemanager,this.username,this.createdAt);

  factory Leave.fromJson(Map<String,dynamic>json)=>
      _$LeaveFromJson(json);
  Map<String,dynamic>toJson()=>_$LeaveToJson(this);
}