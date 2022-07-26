
import 'package:json_annotation/json_annotation.dart';

part 'vmWorkinghourAtd.g.dart';

@JsonSerializable()
class vmWorkinghour{

  String photo;
  String userId;
  String intime;
  String outtime;
  String workingtime;


  vmWorkinghour(
      this.photo, this.userId, this.intime, this.outtime, this.workingtime);

  factory vmWorkinghour.fromJson(Map<String,dynamic>json)=>
      _$vmWorkinghourFromJson(json);
  Map<String,dynamic>toJson()=>_$vmWorkinghourToJson(this);
}