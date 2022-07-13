// ignore: file_names

import 'package:json_annotation/json_annotation.dart';


part 'store.g.dart';

@JsonSerializable()
class store{
  @JsonKey(name: "_id")
  String? id;
  String? storename;
  String? storedmscode;
  String? createdAt;


  store(this.id, this.storename, this.storedmscode, this.createdAt);


  @override
  String toString() {
    return 'store{id: $id, storename: $storename, storedmscode: $storedmscode, createdAt: $createdAt}';
  }

  factory store.fromJson(Map<String,dynamic>json)=>
      _$storeFromJson(json);
  Map<String,dynamic>toJson()=>_$storeToJson(this);
}