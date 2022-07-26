
import 'package:json_annotation/json_annotation.dart';

part 'vmSignoffAtd.g.dart';

@JsonSerializable()
class vmSignoff{

  String photo;
  String outTime;
  String lat;
  String lon;
  String note;


  vmSignoff(
      this.photo, this.outTime,this.lat, this.lon, this.note);

  factory vmSignoff.fromJson(Map<String,dynamic>json)=>
      _$vmSignoffFromJson(json);
  Map<String,dynamic>toJson()=>_$vmSignoffToJson(this);
}