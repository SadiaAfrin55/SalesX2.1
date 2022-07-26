
import 'package:json_annotation/json_annotation.dart';

import 'objectarr.dart';

part 'objResponse.g.dart';

@JsonSerializable()
class attendanceObjectResponse{

  String status;
  int length;
  List<attendanceObject> objectarr;


  attendanceObjectResponse(this.status, this.length, this.objectarr);

  factory attendanceObjectResponse.fromJson(Map<String,dynamic>json)=>
      _$attendanceObjectResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$attendanceObjectResponseToJson(this);
}