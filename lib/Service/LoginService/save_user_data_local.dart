import 'package:hive/hive.dart';

class LoginDataSave{

  Future storeTokenUserdata(Box? users,String? token,String? name,String? email,String? businessUnit, String? userID,String? role,String? employeeId,int? sales,
      int? target,int? targetAchive,String? linemanagerid,String? storename,String? storeId,String? storelat,String? storeLon) async{

    users?.put("token", token);
    users?.put("name", name);
    users?.put("email", email);
    users?.put("businessUnit", businessUnit);
    users?.put("userId", userID);
    users?.put("role", role);


    users?.put("employeeId", employeeId);
    users?.put("sales", sales);
    users?.put("target", target);
    users?.put("targetAchive", targetAchive);
    users?.put("linemanagerid", linemanagerid);
    users?.put("storeId", storeId);
    users?.put("storename", storename);
    users?.put("storelat", storelat);
    users?.put("storeLon", storeLon);

  }


  Future storeManagerData(Box? users,String? id,String? name,String? role,String? phone,String? mail) async{
    users?.put("linmanagerid", id);
    users?.put("linmanagerName", name);
    users?.put("linmanagerEmail", mail);
    users?.put("linmanagerPhone", phone);
    users?.put("linmanagerRole", role);
  }

}