import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Login/Login.dart';
import '../../Data/Model/Store/Store.dart';
import '../../Data/Model/User/User.dart';
import '../../Repository/Login/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  var logger = Logger();
  LoginRepository loginRepository=LoginRepository();
  LoginCubit() : super(LoginInitial());


  void logInUser(String userId,String password,bool isValidate) {
    if(isValidate){
      // emit(UserLoginSuccess());
      loginRepository.loginUser(userId,password).then((login){
        // logger.d(login);
        if(login==null){
          logger.d("faill user");
          emit(UserLoginFaild());
        }
        // logger.d(login?.token);
        // logger.d(login.user.stores.store[0].storename);
        emit(UserLoginData(token: login?.token,user: login?.user,stores: login?.user?.stores?.store));
        emit(UserLoginSuccess());
      });
    }else{
      emit(UserLoginValidationError(errorMsg: "Field is empty"));
      return;
    }

  }
}
