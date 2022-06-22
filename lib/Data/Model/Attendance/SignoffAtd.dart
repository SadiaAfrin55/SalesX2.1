
import 'package:json_annotation/json_annotation.dart';
part 'SignoffAtd.g.dart';

@JsonSerializable()
class SignoffAtd{


  String? photo;
  String? outTime;
  String? userId;
  String? store;
  String? signoffremarks;


  SignoffAtd(
      this.photo, this.outTime, this.userId, this.store, this.signoffremarks);

  factory SignoffAtd.fromJson(Map<String,dynamic>json)=>
      _$SignoffAtdFromJson(json);
  Map<String,dynamic>toJson()=>_$SignoffAtdToJson(this);
}