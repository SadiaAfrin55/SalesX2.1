
import 'package:json_annotation/json_annotation.dart';

part 'vmStoreAtd.g.dart';

@JsonSerializable()
class vmStoreAtd{

  String photo;

  vmStoreAtd({required this.photo});

  factory vmStoreAtd.fromJson(Map<String,dynamic>json)=>
      _$vmStoreAtdFromJson(json);
  Map<String,dynamic>toJson()=>_$vmStoreAtdToJson(this);
}