import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/StoreModel.dart';


class FetchUserList {
  var data = [];
  List<Store> results = [];
  String urlList = 'https://api.salesx-staging.xyz/api/v1/stores?currentpage=1&limit=120';

  Future<List<Store>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => Store.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.storedmscode!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}