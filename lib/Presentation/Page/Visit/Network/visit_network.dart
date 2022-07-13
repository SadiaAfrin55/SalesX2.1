import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../Constants/Strings/app_strings.dart';



class ShopNetwork {

  var logger = Logger();
  
    Future getShop() async{
    try{
      final response=await get(Uri.parse(BASE_URL+'stores?currentpage=1&limit=120'));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future CreateShop (File iamge, String storeId,String useId) async{

    print(storeId);
    print(useId);

    try{
      var request =  http.MultipartRequest(
          'POST', Uri.parse(BASE_URL+"visit/add-visited")
      );

      request.files.add(await http.MultipartFile.fromPath('photo', iamge.path));
      request.fields['shopid'] = storeId;
      request.fields['userid'] = useId;
      logger.d(iamge.path);
      var streamedResponse =await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      logger.d('745 ${response.body}');
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future visitShophistory(String visitDate,String userId) async{
    try{
      //final userid = userId;
      final response=await get(Uri.parse(BASE_URL+'visit/get-visited/'+userId+'?date='+visitDate));

      //final response=await get(Uri.parse(BASE_URL+'visit/get-visited/:'+userId+'?date='+visitDate));
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e);
      return null;
    }
  }



}