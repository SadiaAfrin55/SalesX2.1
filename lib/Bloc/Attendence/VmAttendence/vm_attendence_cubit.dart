
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Data/Model/Attendance/VmAttendance/VmAttendanceResponse.dart';

import '../../../Data/Model/Attendance/VmAttendance/VmAttendance.dart';
import '../../../Data/Model/Attendance/VmAttendance/VmAttendanceResponse.dart';

import '../../../Data/Model/Attendance/VmAttendance/VmAttendanceResponse.dart';
import '../../../Data/Model/Attendance/VmAttendance/VmAttendanceResponse.dart';
import '../../../Data/Model/profile/profile.dart';
import '../../../Repository/Attendence/VmAttendence/vm_attendence_repository.dart';

part 'vm_attendence_state.dart';

class VmAttendenceCubit extends Cubit<VmAttendenceState> {
  var logger = Logger();
  VmAttendenceCubit() : super(VmAttendenceInitial());

  void giveVmAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon, String userAddress) {
    VmAttendanceRepository().giveVmAttendance(iamge,storeId,businessUnit,useId,note,lat,lon,userAddress).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GiveVmAttendance(status: data['success']))
      }
    });
  }

  void giveSignOffAttendance(File iamge, String useId, String note,String lat,String lon, String userAddress) {
    VmAttendanceRepository().giveSignOffAttendance(iamge,useId,note,lat,lon,userAddress).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GiveVmSignOffAttendance(status: data['success']))
      }
    });
  }

  // void loadVmAttendance(String userId) {
  //   VmAttendanceRepository().loadVmAttendance(userId).then((data) => {
  //     logger.d(data),
  //     if(data!=null){
  //       emit(GetVmAttendance(vmAttendancess: data.attendance))
  //     }
  //   });
  // }

  // void loadVmAttendanceByMonth(String userId, String leaveDate) {
  //   print("ddddddddddd");
  //   VmAttendanceByDateResponse datax;
  //   VmAttendanceRepository().loadVmAttendanceByMonth(userId,leaveDate).then((data) => {
  //     logger.d(data),
  //     if(data!=null){
  //         emit(GetVmAttendanceByDate(attendance:null))
  //     }
  //   });
  // }



  void loadVmAttendanceByMonth(String userId) {
    VmAttendanceRepository().loadVmAttendanceByMonth(userId).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GetVmAttendanceByDate(vmAtdResponse:data))
      }
    });
  }

  void profiledata(String userId) {
    VmAttendanceRepository().profiledata(userId).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(getProfiledata(profile:data))
      }
    });
  }

  void chekVmSignffAttendance(String userId) {
    VmAttendanceRepository().chekVmSignffAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value!=null){
        emit(CheckVmSignOffAtendance(attendance: value['attendance']))
      }
    });
  }
  void chekReSignffAttendance(String userId) {
    VmAttendanceRepository().chekReSignffAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value['attendance']!=null){
        emit(CheckReSignOffAtendance(attendance: value['attendance']))
      }
    });
  }


  void giveReAttendance(File iamge, String storeId, String businessUnit, String useId, String note,String lat,String lon, String userAddress) {
    VmAttendanceRepository().giveReAttendance(iamge,storeId,businessUnit,useId,note,lat,lon,userAddress).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GiveVmAttendance(status: data['success']))
      }
    });
  }


  void giveReSignOffAttendance(File iamge, String useId, String note,String lat,String lon, String userAddress) {
    VmAttendanceRepository().giveReSignOffAttendance(iamge,useId,note,lat,lon,userAddress).then((data) => {
      logger.d(data),
      if(data!=null){
        emit(GiveVmSignOffAttendance(status: data['success']))
      }
    });
  }

  // void loadReAttendance(String userId) {
  //   VmAttendanceRepository().loadReAttendance(userId).then((data) => {
  //     logger.d(data),
  //     if(data!=null){
  //       emit(GetVmAttendance(vmAttendancess: data.attendance))
  //     }
  //   });
  // }


  // void loadReAttendanceByMonth(String userId, String leaveDate) {
  //   VmAttendanceByDateResponse datax;
  //   VmAttendanceRepository().loadReAttendanceByMonth(userId,leaveDate).then((data) => {
  //     // logger.d(data),
  //     if(data!=null){
  //       if(data['attendance']==null){
  //         emit(GetVmAttendanceByDate(vmAttendanceByDateResponse:null))
  //       }else{
  //         datax= VmAttendanceByDateResponse.fromJson(data),
  //         emit(GetVmAttendanceByDate(vmAttendanceByDateResponse:datax))
  //       }
  //
  //     }
  //   });
  // }

  void chekVmAttendance(String userId) {
    VmAttendanceRepository().chekVmAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value['attendance']!=null){
        emit(CheckVmAtendance(attendance: value['attendance']))
      }
    });
  }

  void chekReAttendance(String userId) {
    VmAttendanceRepository().chekReAttendance(userId).then((value) => {
      // logger.d(value['attendance']),
      if(value['attendance']!=null){
        emit(CheckReAtendance(attendance: value['attendance']))
      }
    });
  }
}
