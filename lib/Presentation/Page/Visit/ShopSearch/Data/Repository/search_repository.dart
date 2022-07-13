import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../../Constants/Strings/app_strings.dart';
import '../model/shop.dart';

abstract class SearchRepository {
  Future<List<Store>> searchFoods(String query);
}

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Store>> searchFoods(String query) async {
    var response = await http.get(Uri.parse(BASE_URL+'stores?currentpage=1&storedmscode=$query&limit=120'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Store> stores = Shop.fromJson(data).stores;
      return stores;
    } else {
      throw Exception('Failed');
    }
  }
}
