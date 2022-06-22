import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/User/UserResponse.dart';
import '../../Repository/User/uder_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  var logger = Logger();
  UserRepository userRepository=UserRepository();
  UserCubit() : super(UserInitial());

  void getUserInformation(String userEmployeeId){

    userRepository.getUserDetails(userEmployeeId).then((response) => {
      if(response!=null){
        logger.d("get user"),
        emit(UserDetailsData(userResponse: response))
      }
    });

  }
}
