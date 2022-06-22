import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';


class SaleNetwork {
  var logger = Logger();
  Future<Map?> createSale(Map<String, dynamic> data,String productName, String userId, String managerId,String storeId) async{
    try{
      var response=await post(Uri.parse(BASE_URL+"sales/createSale/"+productName+"/"+userId+"/"+managerId+"/"+storeId),
        headers: {
          "Content-type": "application/json",
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

  Future getAllSales(String userId) async {
    try{
      var response=await get(Uri.parse(BASE_URL+"sales/getUserSales/"+userId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }
  }

  Future getUserSaleByMonth(String userId,String leaveDate) async{
    print(leaveDate);
    try{
      //var response=await get(Uri.parse(BASE_URL+"sales/getUserSales/byMonth/"+userId+"/"+leaveDate));
      var response=await get(Uri.parse(BASE_URL+"sales/getUserSales/byMonth/6151a0cc11cb63219269c7e5/"+leaveDate));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }
  }

  Future loadSalesSurvy(String userId) async{
    try{
      var response=await get(Uri.parse(BASE_URL+"sales/getManagerUnderSales/"+userId));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }
  }

  Future getUserSaleSurvyByMonth(String userId, String leaveDate) async{
    try{
      var response=await get(Uri.parse(BASE_URL+"sales/getManagerUnderSales/byMonth/"+userId+"/"+leaveDate));
      logger.d(response.body);
      return json.decode(response.body);
    }catch(err){
      logger.d(err);
    }
  }

  Future getUserSalesSurveyPrediction(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'sales/userSalesPradiction/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getFoeUserSalesSurveyPrediction(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'sales/foeUserSalesPradiction/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future productSalesPrediction(String productId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'sales/productSalesPradiction/'+productId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getReUserSalesSurveyPrediction(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'sales/reUserSalesPradiction/'+userId));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

}