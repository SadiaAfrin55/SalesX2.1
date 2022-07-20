import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../Constants/Strings/app_strings.dart';

class LeaveNetwork {
  var logger = Logger();
  Future getLeaveList(String userId,String token) async{
    print("leave network api");

    try{
      final response=await get(Uri.parse(BASE_URL+'leave/getLeave/'+userId),
        headers: {
          "Content-type": "application/json",
          "Authorization":"Bearer $token"
        },
      );
      logger.d(response.body);
      return json.decode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future getLeaveListByMonth(String userId, String leaveDate) async{
    print("leave datehhhh     "+leaveDate);
    print("userid datehhhh     "+userId);
    try{
      final response=await get(Uri.parse(BASE_URL+'leave/getleave-monthly/'+userId+"/"+leaveDate));
      return json.decode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future createLeave(Map<String, String> data, String token) async{
    try{
      var response=await post(Uri.parse(BASE_URL+"leave"),
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
    }
  }

  Future loadedPendingLeave(String userId,String status) async{
    Logger().e(BASE_URL+'leave/getLeaveManger/'+userId+"/"+status);
    try{
      final response=await get(Uri.parse(BASE_URL+'leave/getLeaveManger/'+userId+"/"+status),
        headers: {
          "Content-type": "application/json",
        },
      );
      logger.d(response.body);
      return json.decode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }

  Future updateLeaveStatus(String id, String status) async{
    try{
      final response=await patch(Uri.parse(BASE_URL+'leave/updateStatus/'+id+"/"+status),
        headers: {
          "Content-type": "application/json",
        },
      );
      // logger.d(response.body);
      return json.decode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }


  Future getLeaveTotal(String id,) async{
    try{
      final response=await get(Uri.parse(BASE_URL+'leave/user-total-leave/'+id),
        headers: {
          "Content-type": "application/json",
        },
      );
      logger.d(response.body);
      return json.decode(response.body);

    }catch(e){
      logger.d(e);
      return null;
    }
  }

}