
import 'package:json_annotation/json_annotation.dart';


part 'profile.g.dart';

@JsonSerializable()
class Profile{

  String? totalAttendance;
  String? absent;


  Profile(this.totalAttendance, this.absent);

  factory Profile.fromJson(Map<String,dynamic>json)=>
      _$ProfileFromJson(json);
  Map<String,dynamic>toJson()=>_$ProfileToJson(this);
}