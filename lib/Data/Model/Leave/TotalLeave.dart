

import 'package:json_annotation/json_annotation.dart';

part 'TotalLeave.g.dart';

@JsonSerializable()
class TotalLeave{


  String status;
  int? casualleave;
  int? sickleave;


  TotalLeave(this.status, this.casualleave, this.sickleave);

  factory TotalLeave.fromJson(Map<String,dynamic>json)=>
      _$TotalLeaveFromJson(json);
  Map<String,dynamic>toJson()=>_$TotalLeaveToJson(this);
}