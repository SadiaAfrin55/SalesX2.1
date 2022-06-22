import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class InventoryNetwork {
  var logger = Logger();

  Future<Map?> createInventory(Map<String, String> data,String storeId,  String token) async{
    try{
      var response=await patch(Uri.parse(BASE_URL+"stores/storeinventorytest/"+storeId),
        headers: {
          "Content-type": "application/json",
          "Authorization":"Bearer $token"
        },
        body: json.encode(data),
      );
      logger.d(response.body);
      return jsonDecode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future<Map?> editInventory(Map<String, String> data,String productId, String storeId, String token) async{
    try{
      var response=await patch(Uri.parse(BASE_URL+"stores/storeproductquantity/"+storeId+"/"+productId),
        headers: {
          "Content-type": "application/json",
          "Authorization":"Bearer $token"
        },
        body: json.encode(data),
      );
      logger.d(response.body);
      return jsonDecode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future DeleteInventory(String storeId, String productId, String token) async{
    try{
      var response=await patch(Uri.parse(BASE_URL+"stores/inventoryproductdelete/"+storeId+"/"+productId),
        headers: {
          "Content-type": "application/json",
          "Authorization":"Bearer $token"
        },
      );
      logger.d(response.body);
      return jsonDecode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }
}