
import 'package:json_annotation/json_annotation.dart';

part 'Notification.g.dart';

@JsonSerializable()
class Notification{
  @JsonKey(name: "_id")
  String id;

  String? dateid;
  String? users;
  String? role;
  String? noticefor;
  String? description;


  Notification(this.id, this.dateid, this.users, this.role, this.noticefor,
      this.description);

  factory Notification.fromJson(Map<String,dynamic>json)=>
      _$NotificationFromJson(json);
  Map<String,dynamic>toJson()=>_$NotificationToJson(this);
}