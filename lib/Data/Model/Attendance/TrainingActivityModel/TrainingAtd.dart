
import 'package:json_annotation/json_annotation.dart';

part 'TrainingAtd.g.dart';

@JsonSerializable()
class TrainingActivityAtd{
  
  String photo;
  String time;
  String remarks;


  TrainingActivityAtd(this.photo, this.time, this.remarks);

  factory TrainingActivityAtd.fromJson(Map<String,dynamic>json)=>
      _$TrainingActivityAtdFromJson(json);
  Map<String,dynamic>toJson()=>_$TrainingActivityAtdToJson(this);
}