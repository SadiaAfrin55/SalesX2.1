import 'package:json_annotation/json_annotation.dart';

import 'Store.dart';


part 'StoreInactiveResponse.g.dart';

@JsonSerializable()
class StoreInactiveResponse{

  String? status;
  int? length;
  List<Store>?stores;

  StoreInactiveResponse(this.status, this.length, this.stores);
  factory StoreInactiveResponse.fromJson(Map<String,dynamic>json)=>
      _$StoreInactiveResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$StoreInactiveResponseToJson(this);

}