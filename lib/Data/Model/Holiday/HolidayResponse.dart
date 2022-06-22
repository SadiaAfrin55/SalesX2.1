import 'package:json_annotation/json_annotation.dart';




part 'HolidayResponse.g.dart';

@JsonSerializable()
class HolidayResponse{
  String success;
  String holiday;

  HolidayResponse(this.success, this.holiday);

  factory HolidayResponse.fromJson(Map<String,dynamic>json)=>
      _$HolidayResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$HolidayResponseToJson(this);
}