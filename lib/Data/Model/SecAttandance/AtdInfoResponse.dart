
import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Data/Model/SecAttandance/AtdInfo.dart';

part 'AtdInfoResponse.g.dart';

@JsonSerializable()
class AtdInfoResponse{

  String? status;
  int? length;
  List<AtdInfo>? objectarr;


  AtdInfoResponse(this.status, this.length, this.objectarr);

  factory AtdInfoResponse.fromJson(Map<String,dynamic>json)=>
      _$AtdInfoResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AtdInfoResponseToJson(this);
}