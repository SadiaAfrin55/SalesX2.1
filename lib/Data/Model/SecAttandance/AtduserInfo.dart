
import 'package:json_annotation/json_annotation.dart';

part 'AtduserInfo.g.dart';

@JsonSerializable()
class AtdUserInfo{

  String? createdAt;


  AtdUserInfo(this.createdAt);

  factory AtdUserInfo.fromJson(Map<String,dynamic>json)=>
      _$AtdUserInfoFromJson(json);
  Map<String,dynamic>toJson()=>_$AtdUserInfoToJson(this);
}