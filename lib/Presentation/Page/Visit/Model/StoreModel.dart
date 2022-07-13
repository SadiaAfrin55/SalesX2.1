

class Store {
  String? lat;
  String? lon;
  String? status;
  String? sId;
  String? storename;
  String? storedmscode;
  String? storetype;
  String? holiday;
  String? location;
  String? teritory;
  String? area;
  String? district;
  String? division;
  String? cutofftime;
  List<Inventory>? inventory;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Store(
      {this.lat,
        this.lon,
        this.status,
        this.sId,
        this.storename,
        this.storedmscode,
        this.storetype,
        this.holiday,
        this.location,
        this.teritory,
        this.area,
        this.district,
        this.division,
        this.cutofftime,
        this.inventory,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Store.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    status = json['status'];
    sId = json['_id'];
    storename = json['storename'];
    storedmscode = json['storedmscode'];
    storetype = json['storetype'];
    holiday = json['holiday'];
    location = json['location'];
    teritory = json['teritory'];
    area = json['area'];
    district = json['district'];
    division = json['division'];
    cutofftime = json['cutofftime'];
    if (json['inventory'] != null) {
      inventory = <Inventory>[];
      json['inventory'].forEach((v) {
        inventory!.add(new Inventory.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['storename'] = this.storename;
    data['storedmscode'] = this.storedmscode;
    data['storetype'] = this.storetype;
    data['holiday'] = this.holiday;
    data['location'] = this.location;
    data['teritory'] = this.teritory;
    data['area'] = this.area;
    data['district'] = this.district;
    data['division'] = this.division;
    data['cutofftime'] = this.cutofftime;
    if (this.inventory != null) {
      data['inventory'] = this.inventory!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Inventory {
  int? quantity;
  String? sId;
  Product? product;

  Inventory({this.quantity, this.sId, this.product});

  Inventory.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    sId = json['_id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? sId;
  String? productName;
  String? month;
  String? year;
  String? category;
  String? subcategory;
  String? recomendedprice;
  String? promoprice;
  String? emitenure;
  String? devicevariant;
  String? color;
  String? businessUnit;
  String? maxRetailPrice;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.sId,
        this.productName,
        this.month,
        this.year,
        this.category,
        this.subcategory,
        this.recomendedprice,
        this.promoprice,
        this.emitenure,
        this.devicevariant,
        this.color,
        this.businessUnit,
        this.maxRetailPrice,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['productName'];
    month = json['month'];
    year = json['year'];
    category = json['category'];
    subcategory = json['subcategory'];
    recomendedprice = json['recomendedprice'];
    promoprice = json['promoprice'];
    emitenure = json['emitenure'];
    devicevariant = json['devicevariant'];
    color = json['color'];
    businessUnit = json['businessUnit'];
    maxRetailPrice = json['maxRetailPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['productName'] = this.productName;
    data['month'] = this.month;
    data['year'] = this.year;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['recomendedprice'] = this.recomendedprice;
    data['promoprice'] = this.promoprice;
    data['emitenure'] = this.emitenure;
    data['devicevariant'] = this.devicevariant;
    data['color'] = this.color;
    data['businessUnit'] = this.businessUnit;
    data['maxRetailPrice'] = this.maxRetailPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
