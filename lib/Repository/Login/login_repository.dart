
import 'package:logger/logger.dart';

import '../../Data/Model/Login/Login.dart';
import '../../Network/Login/login_network.dart';

class LoginRepository {
  LoginNetwork loginNetwork=LoginNetwork();
  var logger = Logger();

  Future<Login?> loginUser(String userid,String password) async {
    Map<String, String> data = {
      "employeeId":userid,
      "password": password,
    };
    final userRaw=await loginNetwork.login(data);
    // logger.d(userRaw.toString());
    // logger.d(userRaw['success']);
    if(userRaw['status']!="success"){
      return null;
    }
    if (userRaw == null) return null;

    Login login=Login.fromJson(userRaw);

    print(login.status);
    print(Login.fromJson(userRaw));
    // logger.d(login.user.stores.store[0].storename);
    return Login.fromJson(userRaw);
  }
}