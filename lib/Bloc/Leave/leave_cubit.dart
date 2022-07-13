import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Leave/Leave.dart';
import '../../Data/Model/Leave/LeaveCreateResponse.dart';
import '../../Data/Model/Leave/LeaveResponse.dart';
import '../../Data/Model/Leave/TotalLeave.dart';
import '../../Repository/Leave/leave_repository.dart';
part 'leave_state.dart';

class LeaveCubit extends Cubit<LeaveState> {

  var logger = Logger();
  LeaveCubit() : super(LeaveInitial());

  // void loadedLeave(String userId,String token){
  //   LeaveRepository().getLeave(userId,token).then((leave){
  //     logger.d(leave);
  //     if(leave!=null){
  //       emit(LeaveLoded(leaveResponse: leave));
  //     }
  //     emit(LeaveError('Some error'));
  //
  //   });
  // }

        void loadedLeaveByMonth(String userId, String leaveDate){
          LeaveRepository().getLeaveByMonth(userId,leaveDate).then((leave){
            
            log('mh 777 $leave');


            if(leave!=null){
           return   emit(LeaveLoded(leaveResponse: leave)
              );


            }

      emit(LeaveError('Some error'));


    });
  }

  void createLeave(String date,String reason,String leaveFormat,String userId,String linmanagerid,String acceptence,String token){
    print("leave cubit api");
    LeaveRepository().createLevae( date, reason, leaveFormat,userId,linmanagerid, acceptence, token).then((leave) {
      if(leave!=null){
        logger.d(leave);
        LeaveCreateResponse leaveCreateResponse=leave;
        emit(LeaveCreate(response: leaveCreateResponse.status,leave: leaveCreateResponse.newleaveform));
      }
    });
  }

  void loadedPendingLeave(String userId,String status, String token) {
    LeaveRepository().loadedPendingLeave(userId,status,token).then((leave){
      // logger.d(leave);
      if(leave!=null){
        emit(LeaveLoded(leaveResponse: leave));
      }

    });
  }

  void loadedApprovedLeave(String linemanageId, String status, String token) {
    LeaveRepository().loadedPendingLeave(linemanageId,status,token).then((leave){
      logger.d(leave);
      if(leave!=null){
        emit(ApprovedLeaveLoded(leaveResponse: leave));
      }

    });
  }

  void loadedRejectLeave(String linemanageId, String status, String token) {
    LeaveRepository().loadedPendingLeave(linemanageId,status,token).then((leave){
      logger.d(leave);
      if(leave!=null){
        emit(RejectedLeaveLoded(leaveResponse: leave));
      }

    });
  }

  void updateLeaveStatus(String id, String status) {
    LeaveRepository().updateLeaveStatus(id,status).then((leave){
      logger.d(leave);
      if(leave!=null){
        emit(UpdateStatus());
      }
    });
  }

  void getLeaveTotal(String userId) {
    LeaveRepository().getLeaveTotal(userId).then((leave){
      logger.d(leave);
      if(leave!=null){
        emit(GetTotalLeave(totalLeave: leave));
      }
    });
  }
}
