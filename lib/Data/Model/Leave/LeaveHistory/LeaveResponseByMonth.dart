

import 'package:json_annotation/json_annotation.dart';

import 'Leave.dart';


part 'LeaveResponseByMonth.g.dart';

@JsonSerializable()
class LeaveResponseByMonth{

 final String? status;
 final int? length;
 @JsonKey(
  name:'leave'
 )
 final List<Leave>? leaveform;

  LeaveResponseByMonth({this.status, this.length, this.leaveform});

 factory LeaveResponseByMonth.fromJson(Map<String,dynamic>json)=>
     _$LeaveResponseByMonthFromJson(json);
 Map<String,dynamic>toJson()=>_$LeaveResponseByMonthToJson(this);

 @override
 String toString() {

  return 'status: $status , lenght: $length,leaveform:  $leaveform';

  }


}