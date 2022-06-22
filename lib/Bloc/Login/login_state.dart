part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginUser extends LoginState{
  late final Login? login;

  LoginUser({this.login});
}

class UserLoginFaild extends LoginState{}

class UserLoginSuccess extends LoginState{}

class UserLoginValidationError extends LoginState{
  final String? errorMsg;
  UserLoginValidationError({this.errorMsg});
}
class UserLoginData extends LoginState{
  final String? token;
  final User? user;
  final List<Store>? stores;
  UserLoginData({this.token, this.user,this.stores});

}