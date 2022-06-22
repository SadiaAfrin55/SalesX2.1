import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:salesx_new_project/Repository/OmActivity/om_activity_repository.dart';

part 'om_activity_state.dart';

class OmActivityCubit extends Cubit<OmActivityState> {
  var logger = Logger();
  OmActivityRepository omActivityRepository = OmActivityRepository();
  OmActivityCubit() : super(OmActivityInitial());

  // void omAttendance(String userId) {
  //   omActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void omTarget(String userId) {
  //   omActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void omLeave(String userId) {
  //   omActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
  // void omTraining(String userId) {
  //   omActivityRepository.loadUserAttendance(userId).then((value) => {
  //     logger.d(value),
  //     if(value!=null){
  //       emit(GetUserAttendance(attendance: value.attendance))
  //     }
  //   });
  // }
}
