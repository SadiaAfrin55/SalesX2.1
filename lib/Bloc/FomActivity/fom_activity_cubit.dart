import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Repository/FomActivity/fom_activity_repository.dart';

part 'fom_activity_state.dart';

class FomActivityCubit extends Cubit<FomActivityState> {
  var logger = Logger();
  FomActivityRepository fomActivityRepository = FomActivityRepository();
  FomActivityCubit() : super(FomActivityInitial());

  // void fomAttendance(String userId) {
  //   fomActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void fomTarget(String userId) {
  //   fomActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void fomLeave(String userId) {
  //   fomActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void fomTraining(String userId) {
  //   fomActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
}
