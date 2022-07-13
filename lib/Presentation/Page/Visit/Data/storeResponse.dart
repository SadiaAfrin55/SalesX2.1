
import 'package:json_annotation/json_annotation.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Data/store.dart';



part 'storeResponse.g.dart';

@JsonSerializable()
class storeResponse{

  String? status;
  int? length;
  List<store>? stores;


  storeResponse(this.status, this.length, this.stores);

  factory storeResponse.fromJson(Map<String,dynamic>json)=>
      _$storeResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$storeResponseToJson(this);
}