

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/Notification/Notification.dart';



part 'NotificationResponse.g.dart';

@JsonSerializable()
class NotificationResponse{

  String? status;
  int? length;
  List<Notification?> noticeBoardForm;


  NotificationResponse(this.status, this.length, this.noticeBoardForm);

  factory NotificationResponse.fromJson(Map<String,dynamic>json)=>
      _$NotificationResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$NotificationResponseToJson(this);
}