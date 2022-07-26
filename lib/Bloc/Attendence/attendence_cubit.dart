import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Attendance/Attendance.dart';
import '../../Repository/Attendence/attendence_repository.dart';
import '../../Repository/Store/store_repository.dart';

part 'attendence_state.dart';

class AttendenceCubit extends Cubit<AttendenceState> {
  var logger = Logger();

  AttendenceCubit() : super(AttendenceInitial());
  
  void checkLateAttendance(String formattedDate) {
    print("late attendence");
    AttendanceRepository().checkLateAttendance(formattedDate).then((value) => {
       logger.d(value['status']),
      if(value!=null){
        emit(CheckMoringLateAttendance(status: value['status']))
      }

    });
  }

  void giveMorningAttendance(File iamge, String storeId, String businessUnit,String useId,String role, String userAddress) {
    AttendanceRepository().giveMorningAttendance(iamge,storeId,businessUnit,useId,role,userAddress).then((data) => {
      logger.d(data['success']),
      if(data!=null){
        emit(MarkMorningAttendance(attendance: data['success']))
      }
    });
  }

  void giveEveningAttendance(File iamge, String storeId, String businessUnit, String useId) {
    AttendanceRepository().giveEveningAttendance(iamge,storeId,businessUnit,useId).then((data) => {
      // logger.d(data['success']),
      if(data['success']){
        emit(MarkEveningAttendances(attendance: data['success']))
      }
    });
  }

  void giveTrainingAttendance(File iamge, String businessUnit, String useId, String role, String userAddress) {
    AttendanceRepository().giveTrainingAttendance(iamge,businessUnit,useId,role,userAddress).then((data) => {
      logger.d(data['success']),
      if(data!=null){
        emit(MarkMorningAttendance(attendance: data['success']))
      }
    });
  }



  void chekUserAttendance(String userId) {
    AttendanceRepository().chekUserAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(CheckUserAttendance(attendance: value['attendance']))
      }
    });
  }

  void chekUserEveningAttendance(String userId) {
    AttendanceRepository().chekUserEveningAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(CheckUserEveningAttendance(attendance: value['attendance']))
      }
    });
  }



  void loadUserAttendance(String userId) {
    AttendanceRepository().loadUserAttendance(userId).then((value) => {
      logger.d(value),
      if(value!=null){
        emit(GetUserAttendance(attendance: value.attendance))
      }
    });
  }

  void loadUserAttendanceByMonth(String userId, String leaveDate) {
    AttendanceRepository().loadUserAttendanceByMonth(userId,leaveDate).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(GetUserAttendanceByMonth(attendance: value.attendance))
      }
    });
  }

  void giveMorningLateAttendance(File iamge, String storeId, String businessUnit, String useId, String role, String note, String userAddress) {
    AttendanceRepository().giveMorningLateAttendance(iamge,storeId,businessUnit,useId,role,note,userAddress).then((data) => {
      // logger.d(data['success']),
      if(data!=null){
        emit(MarkMorningAttendance(attendance: data['success']))
      }
    });
  }


  void loadSecAttendance(String userId) {
    AttendanceRepository().loadSecAttendance(userId).then((value) => {
      logger.d(value),
      if(value!=null){
        //emit(GetSecAttendance(attendance: value.attendance))
      }
    });
  }


  void checkHoliday(String formattedDate) {
    AttendanceRepository().checkHoliday(formattedDate).then((data) => {
      // logger.d(data),
      if(data!=null){
        emit(HolidayCheck(holiday:data.holiday ))
      }
    });
  }

  void checkStoreHoliday(String userId) {
    StoreRepository().checkStoreHoliday(userId).then((data) => {
      if(data!=null){
        // logger.d(data),
        emit(StoreHolidayCheck(holiday:data.holiday ))

      }
    });
  }


}
