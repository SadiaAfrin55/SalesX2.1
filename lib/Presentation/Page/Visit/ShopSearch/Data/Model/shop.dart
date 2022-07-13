// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    required this.status,
    required this.length,
    required this.stores,
    required this.totalpage,
  });

  String status;
  int length;
  List<Store> stores;
  int totalpage;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    status: json["status"],
    length: json["length"],
    stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
    totalpage: json["totalpage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "length": length,
    "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
    "totalpage": totalpage,
  };
}

class Store {
  Store({
    required this.users,
    required this.lat,
    required this.lon,
    required this.status,
    required this.id,
    required this.storename,
    required this.storedmscode,
    required this.storetype,
    required this.holiday,
    required this.location,
    required this.teritory,
    required this.area,
    required this.district,
    required this.division,
    required this.cutofftime,
    required this.inventory,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  List<dynamic> users;
  String lat;
  String lon;
  String status;
  String id;
  String storename;
  String storedmscode;
  String storetype;
  String holiday;
  String location;
  String teritory;
  String area;
  String district;
  String division;
  String cutofftime;
  List<dynamic> inventory;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    users: List<dynamic>.from(json["users"].map((x) => x)),
    lat: json["lat"],
    lon: json["lon"],
    status: json["status"],
    id: json["_id"],
    storename: json["storename"],
    storedmscode: json["storedmscode"],
    storetype: json["storetype"],
    holiday: json["holiday"],
    location: json["location"],
    teritory: json["teritory"],
    area: json["area"],
    district: json["district"],
    division: json["division"],
    cutofftime: json["cutofftime"],
    inventory: List<dynamic>.from(json["inventory"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x)),
    "lat": lat,
    "lon": lon,
    "status": status,
    "_id": id,
    "storename": storename,
    "storedmscode": storedmscode,
    "storetype": storetype,
    "holiday": holiday,
    "location": location,
    "teritory": teritory,
    "area": area,
    "district": district,
    "division": division,
    "cutofftime": cutofftime,
    "inventory": List<dynamic>.from(inventory.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
