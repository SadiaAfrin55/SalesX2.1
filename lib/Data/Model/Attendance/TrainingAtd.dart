
import 'package:json_annotation/json_annotation.dart';




part 'TrainingAtd.g.dart';

@JsonSerializable()
class TrainingAtd{


  String? photo;
  String? intime;
  String? morningremarks;


  TrainingAtd(
      this.photo, this.intime,this.morningremarks);

  factory TrainingAtd.fromJson(Map<String,dynamic>json)=>
      _$TrainingAtdFromJson(json);
  Map<String,dynamic>toJson()=>_$TrainingAtdToJson(this);
}