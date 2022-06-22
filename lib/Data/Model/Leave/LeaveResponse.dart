

import 'package:json_annotation/json_annotation.dart';

import 'Leave.dart';


part 'LeaveResponse.g.dart';

@JsonSerializable()
class LeaveResponse{

 final String? status;
 final int? length;
 @JsonKey(
  name:'leave'
 )
 final List<Leave>? leaveform;

  LeaveResponse({this.status, this.length, this.leaveform});

 factory LeaveResponse.fromJson(Map<String,dynamic>json)=>
     _$LeaveResponseFromJson(json);
 Map<String,dynamic>toJson()=>_$LeaveResponseToJson(this);

 @override
 String toString() {

  return 'status: $status , lenght: $length,leaveform:  $leaveform';

  }


}