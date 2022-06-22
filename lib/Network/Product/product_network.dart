import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart';
import '../../Constants/Strings/app_strings.dart';


class ProductNetwork {
  var logger = Logger();

  Future getAllProduct(String storeId, String userId)async {
    try{
      var response=await get(Uri.parse(BASE_URL+"stores/products/"+storeId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }

  }

  Future loadAllProducts() async{
    print("load all products");
    try{
      var response=await get(Uri.parse(BASE_URL+"products/"));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }
  }


}