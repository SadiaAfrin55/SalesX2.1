
import 'package:json_annotation/json_annotation.dart';

part 'AtdInfo.g.dart';

@JsonSerializable()
class AtdInfo{

  String? name;
  String? phoneNumber;
  String? trainingintime;


  AtdInfo(this.name, this.phoneNumber, this.trainingintime);

  factory AtdInfo.fromJson(Map<String,dynamic>json)=>
      _$AtdInfoFromJson(json);
  Map<String,dynamic>toJson()=>_$AtdInfoToJson(this);
}