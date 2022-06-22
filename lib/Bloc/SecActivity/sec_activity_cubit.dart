import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Repository/SecActivity/sec_activity_repository.dart';

part 'sec_activity_state.dart';

class SecActivityCubit extends Cubit<SecActivityState> {
  var logger = Logger();
  SecActivityRepository secActivityRepository = SecActivityRepository();
  SecActivityCubit() : super(SecActivityInitial());

  // void secAttendance(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void secSales(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void secSurvey(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void secTarget(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void secInventory(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void secLeave(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void secTraining(String userId) {
  //   secActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
}
