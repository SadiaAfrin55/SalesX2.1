
import 'package:json_annotation/json_annotation.dart';

part 'traingAtd.g.dart';

@JsonSerializable()
class SecTrainingAtdModel{
  
  String? photo;
  String? time;
  String? remarks;


  SecTrainingAtdModel(this.photo, this.time, this.remarks);

  factory SecTrainingAtdModel.fromJson(Map<String,dynamic>json)=>
      _$SecTrainingAtdModelFromJson(json);
  Map<String,dynamic>toJson()=>_$SecTrainingAtdModelToJson(this);
}