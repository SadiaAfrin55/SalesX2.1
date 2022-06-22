part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserDetailsData extends UserState{
  final UserResponse? userResponse;
  UserDetailsData({this.userResponse});
}