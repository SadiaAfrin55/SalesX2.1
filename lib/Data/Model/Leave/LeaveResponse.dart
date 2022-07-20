

import 'package:json_annotation/json_annotation.dart';

import 'Leave.dart';


part 'LeaveResponse.g.dart';

@JsonSerializable()
class LeaveResponse{

  String? status;
  int? length;
  List<Leave>? leaveform;

  LeaveResponse({this.status, this.length, this.leaveform});

 factory LeaveResponse.fromJson(Map<String,dynamic>json)=>
     _$LeaveResponseFromJson(json);
 Map<String,dynamic>toJson()=>_$LeaveResponseToJson(this);

}