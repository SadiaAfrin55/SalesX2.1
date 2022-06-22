
import 'package:json_annotation/json_annotation.dart';

import 'Store.dart';


part 'StoreGetResponse.g.dart';

@JsonSerializable()
class StoreGetResponse{

  String status;
  int? length;
  List<Store>?stores;


  StoreGetResponse(this.status, this.length, this.stores);

  factory StoreGetResponse.fromJson(Map<String,dynamic>json)=>
      _$StoreGetResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$StoreGetResponseToJson(this);
}