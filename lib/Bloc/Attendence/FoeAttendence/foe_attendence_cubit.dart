
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../Repository/Attendence/FoeAttendence/foeattendence_repository.dart';

part 'foe_attendence_state.dart';

class FoeAttendenceCubit extends Cubit<FoeAttendenceState> {
  var logger = Logger();
  FoeAttendanceRepository foeAttendanceRepository = FoeAttendanceRepository();
  FoeAttendenceCubit() : super(FoeAttendenceInitial());

  void giveFoeAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon) {
    foeAttendanceRepository.giveFoeAttendance(iamge,storeId,businessUnit,useId,note,lat,lon).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GiveFoeAttendance(status: data['success']))
      }
    });
  }

  void giveSignOffAttendance(File iamge, String useId, String note) {
    foeAttendanceRepository.giveSignOffAttendance(iamge,useId,note).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GiveFoeSignOffAttendance(status: data['success']))
      }
    });
  }

  // void loadFoeAttendance(String userId) {
  //   foeAttendanceRepository.loadVmAttendance(userId).then((data) => {
  //     logger.d(data),
  //     if(data!=null){
  //       emit(GetFoeAttendance(foeAttendancess: data.attendance))
  //     }
  //   });
  // }
  //
  // void loadFoeAttendanceByMonth(String userId, String leaveDate) {
  //   foeAttendanceRepository.loadVmAttendanceByMonth(userId,leaveDate).then((data) => {
  //     logger.d(data),
  //     if(data!=null){
  //       emit(GetFoeAttendanceByDate(foeAttendanceByDateResponse: data))
  //     }
  //   });
  // }

  void chekFoeSignffAttendance(String userId) {
    foeAttendanceRepository.chekVmSignffAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(CheckFoeSignOffAtendance(attendance: value['attendance']))
      }
    });
  }

  void getSecAttenadceSurvey(String userId) {
    foeAttendanceRepository.getSecAttenadceSurvey(userId).then((value) => {
      // logger.d(value['total']),
      if(value['success']==true){
        emit(GetSecAttendance(total: value['total'],absent: value['absent'],present: value['present']))
      }
    });
  }

  void getSecAttenadceSurveyRe(String userId) {
    foeAttendanceRepository.getSecAttenadceSurveyRe(userId).then((value) => {
      // logger.d(value['total']),
      if(value['success']==true){
        emit(GetSecAttendance(total: value['total'],absent: value['absent'],present: value['present']))
      }
    });
  }

}
