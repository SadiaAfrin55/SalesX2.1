import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

import '../../Constants/Strings/app_strings.dart';

class StoreNetwork {
  var logger = Logger();
  Future checkStoreHoliday(String userId) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'attendance/chekStoreHoliday/'+userId),
        headers: {
          "Content-type": "application/json",
        },
      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      // logger.d(e.toString());
      return null;
    }
  }

  Future<Map?> createStore(Map<String, dynamic> data)async {
    try{
      final response=await post(Uri.parse(BASE_URL+'stores/'),
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode(data),
      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }

  Future loadInActiveStore() async{
    try{
      final response=await get(Uri.parse(BASE_URL+'stores/inactiveStores'),
        headers: {
          "Content-type": "application/json",
        },

      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }

  Future<Map?> updateOutlate(Map<String, dynamic> data, String id) async{
    try{
      final response=await patch(Uri.parse(BASE_URL+'stores/'+id),
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode(data),
      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }

  Future getAllStore() async{
    try{
      final response=await get(Uri.parse(BASE_URL+'stores/'),
        headers: {
          "Content-type": "application/json",
        },
      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }

  Future checkStoreLanLot(String storeId) async{
    print("ssssssssss"+storeId);
    print(storeId);
    try{
      final response=await get(Uri.parse(BASE_URL+'stores/latloncheck/'+storeId),
        headers: {
          "Content-type": "application/json",
        },
      );
      logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }



  Future updateStoreLanLot(String storeId, Map<String, dynamic> data) async{
    try{
      final response=await patch(Uri.parse(BASE_URL+'stores/'+storeId),
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode(data),
      );
      // logger.d(response.body);
      return json.decode(response.body);
    }catch(e){
      logger.d(e.toString());
      return null;
    }
  }




}