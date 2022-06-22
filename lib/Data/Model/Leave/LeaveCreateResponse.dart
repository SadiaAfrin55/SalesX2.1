
import 'package:json_annotation/json_annotation.dart';

import 'Leave.dart';
part 'LeaveCreateResponse.g.dart';

@JsonSerializable()
class LeaveCreateResponse{
  final String? status;
  final Leave? newleaveform;

  LeaveCreateResponse(this.status, this.newleaveform);

  factory LeaveCreateResponse.fromJson(Map<String,dynamic>json)=>
      _$LeaveCreateResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$LeaveCreateResponseToJson(this);

}