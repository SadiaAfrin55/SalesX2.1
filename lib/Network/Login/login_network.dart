import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart';
import '../../Constants/Strings/app_strings.dart';

class LoginNetwork {
  var logger = Logger();

  Future login(Map<String, String> map) async {
    try {
      var response = await post(
        Uri.parse(BASE_URL + "users/login"),
        headers: {
          "Content-type": "application/json"
        },
        body: json.encode(map),
      );
      // logger.d(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}