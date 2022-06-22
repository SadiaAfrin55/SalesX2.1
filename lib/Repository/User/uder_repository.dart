

import 'package:logger/logger.dart';
import '../../Data/Model/User/UserResponse.dart';
import '../../Network/User/user_network.dart';

class UserRepository {
  UserNetwork userNetwork=UserNetwork();
  var logger = Logger();

  Future<UserResponse> getUserDetails(String userEmployeeId) async {
    final raw= await userNetwork.getUserDetails(userEmployeeId);
    logger.d(raw);
    return UserResponse.fromJson(raw);
  }

}