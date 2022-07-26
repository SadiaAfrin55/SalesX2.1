import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';


part 'foe_activity_state.dart';

class FoeActivityCubit extends Cubit<FoeActivityState> {
  var logger = Logger();
  //FoeActivityRepository foeActivityRepository = FoeActivityRepository();
  FoeActivityCubit() : super(FoeActivityInitial());

  // void foeAttendance(String userId) {
  //   foeActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void foeTarget(String userId) {
  //   foeActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void foeLeave(String userId) {
  //   foeActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void foeTraining(String userId) {
  //   foeActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
}
