
import 'package:logger/logger.dart';
import 'package:salesx_new_project/Data/Model/Sec/SecSurvey/surveyResponse.dart';
import 'package:salesx_new_project/Network/List/list_network.dart';

import '../../Data/Model/List/LinemanagerResponse.dart';
import '../../Data/Model/Notification/NotificationResponse.dart';
import '../../Data/Model/Sale/SaleResponse.dart';
import '../../Data/Model/SecAttandance/AtdInfoResponse.dart';
import '../../Data/Model/SecTraining/secTrainingResponse.dart';
import '../../Network/Notification/notification_network.dart';

class ListRepository{
  var logger = Logger();

  Future loadSeclist(String linemanagerid) async{
    final rawx=await ListNetwork().loadedSec(linemanagerid);
    logger.d(rawx);
    return SecResponse.fromJson(rawx);
  }

  Future loadSecList() async{
    final rawx=await ListNetwork().loadedAllSec();
    logger.d(rawx);
    return SecResponse.fromJson(rawx);
  }

  Future loadSmList() async{
    final rawx=await ListNetwork().loadedAllSm();
    logger.d(rawx);
    return SecResponse.fromJson(rawx);
  }

  Future loadFomList() async{
    final rawx=await ListNetwork().loadedAllFom();
    logger.d(rawx);
    return SecResponse.fromJson(rawx);
  }

  Future loadFoeList() async{
    final rawx=await ListNetwork().loadedAllFoe();
    logger.d(rawx);
    return SecResponse.fromJson(rawx);
  }

  Future loadSecSurvey() async{
    final rawx=await ListNetwork().loadedAllSecSurvey();
    logger.d(rawx);
    return SecSurveyResponse.fromJson(rawx);
  }

  Future loadSecSales() async{
    final rawx=await ListNetwork().loadedAllSecSales();
    logger.d(rawx);
    return SaleResponse.fromJson(rawx);
  }

  Future<secTrainingResponse> loadUserAttendanceByMonth(String leaveDate) async{
    final rawx=await ListNetwork().loadSecTrainingByMonth(leaveDate);
    logger.d(rawx);
    return secTrainingResponse.fromJson(rawx);
  }

  Future<secTrainingResponse> OmloadUserAttendanceByMonth(String leaveDate) async{
    final rawx=await ListNetwork().loadOmTrainingByMonth(leaveDate);
    logger.d(rawx);
    return secTrainingResponse.fromJson(rawx);
  }

  Future<secTrainingResponse> FomloadUserAttendanceByMonth(String leaveDate) async{
    final rawx=await ListNetwork().loadFomTrainingByMonth(leaveDate);
    logger.d(rawx);
    return secTrainingResponse.fromJson(rawx);
  }

  Future<secTrainingResponse> FoeloadUserAttendanceByMonth(String leaveDate) async{
    final rawx=await ListNetwork().loadFoeTrainingByMonth(leaveDate);
    logger.d(rawx);
    return secTrainingResponse.fromJson(rawx);
  }

  Future<AtdInfoResponse> FoeloadAttendanceByMonth(String leaveDate,String linemanagerId) async{
    final rawx=await ListNetwork().loadAttandanceByMonth(leaveDate,linemanagerId);
    logger.d(rawx);
    return AtdInfoResponse.fromJson(rawx);
  }

}
