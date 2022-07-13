// ignore: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Data/visit.dart';


part 'visitResponse.g.dart';

@JsonSerializable()
class visitResponse{
  // @JsonKey(name: "_id")
  String? status;
  int? length;
  List<visit>? allVisited;


  visitResponse(this.status, this.length, this.allVisited);

  factory visitResponse.fromJson(Map<String,dynamic>json)=>
      _$visitResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$visitResponseToJson(this);
}