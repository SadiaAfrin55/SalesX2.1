import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Data/Model/List/LinemanagerResponse.dart';
import 'package:salesx_new_project/Data/Model/Sale/SaleResponse.dart';
import 'package:salesx_new_project/Data/Model/Sec/SecSurvey/surveyResponse.dart';

import '../../Data/Model/SecAttandance/AtdInfoResponse.dart';
import '../../Data/Model/SecTraining/secTrainingResponse.dart';
import '../../Repository/List/list_repository.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  var logger = Logger();
  ListCubit() : super(ListInitial());



  void loadSecdata(String linemanagerid) {
    ListRepository().loadSeclist(linemanagerid).then((response) => {
      if(response!=null){
        emit(SecGet(secResponse: response)),
        logger.d(response)
      }
    });
  }

  void GetSecTrainingAtd(String leaveDate) {
    ListRepository().loadUserAttendanceByMonth(leaveDate).then((response) => {
      if(response!=null){
        emit(SecTrainingAtd(trainingResponse: response)),
        logger.d(response)
      }
    });
  }

  void GetOmTrainingAtd(String leaveDate) {
    ListRepository().OmloadUserAttendanceByMonth(leaveDate).then((response) => {
      if(response!=null){
        emit(SecTrainingAtd(trainingResponse: response)),
        logger.d(response)
      }
    });
  }

  void GetFomTrainingAtd(String leaveDate) {
    ListRepository().FomloadUserAttendanceByMonth(leaveDate).then((response) => {
      if(response!=null){
        emit(SecTrainingAtd(trainingResponse: response)),
        logger.d(response)
      }
    });
  }

  void GetFoeTrainingAtd(String leaveDate) {
    ListRepository().FoeloadUserAttendanceByMonth(leaveDate).then((response) => {
      if(response!=null){
        emit(SecTrainingAtd(trainingResponse: response)),
        logger.d(response)
      }
    });
  }

  void GetAtd(String leaveDate,String linemanagerId) {
    ListRepository().FoeloadAttendanceByMonth(leaveDate,linemanagerId).then((response) => {
      if(response!=null){
        emit(SecAtd(atdInfoResponse: response)),
        logger.d(response)
      }
    });
  }


  void loadSec() {
    ListRepository().loadSecList().then((response) => {
      if(response!=null){
        emit(SecGet(secResponse: response)),
        logger.d(response)
      }
    });
  }

  void loadSm() {
    ListRepository().loadSmList().then((response) => {
      if(response!=null){
        emit(SecGet(secResponse: response)),
        logger.d(response)
      }
    });
  }

  void loadFom() {
    ListRepository().loadFomList().then((response) => {
      if(response!=null){
        emit(SecGet(secResponse: response)),
        logger.d(response)
      }
    });
  }

  void loadFoe() {
    ListRepository().loadFoeList().then((response) => {
      if(response!=null){
        emit(SecGet(secResponse: response)),
        logger.d(response)
      }
    });
  }

  void loadSecSurvey() {
    ListRepository().loadSecSurvey().then((val) => {
      if(val!=null){
        emit(GetSecSurvey(secSurveyResponse: val)),
        logger.d(val)
      }
    });
  }

  void loadSecSale() {
    ListRepository().loadSecSales().then((val) => {
      if(val!=null){
        emit(GetSecSale(saleResponse: val)),
        logger.d(val)
      }
    });
  }


}
