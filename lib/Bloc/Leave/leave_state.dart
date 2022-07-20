part of 'leave_cubit.dart';

@immutable
abstract class LeaveState {}

class LeaveInitial extends LeaveState {}

class LeaveError extends LeaveState {
  final String message;
  LeaveError(this.message);
}

class LeaveLodedByMonth extends LeaveState {
  final LeaveResponseByMonth leaveResponseByMonth;
  // final LeaveStatus leaveStatus;
  LeaveLodedByMonth({required this.leaveResponseByMonth});
}

class LeaveLoded extends LeaveState {
  final LeaveResponse? leaveResponse;
  // final LeaveStatus leaveStatus;
  LeaveLoded({required this.leaveResponse});
}

class ApprovedLeaveLoded extends LeaveState {
  final LeaveResponse? leaveResponse;
  ApprovedLeaveLoded({this.leaveResponse});
}

class RejectedLeaveLoded extends LeaveState {
  final LeaveResponse? leaveResponse;
  RejectedLeaveLoded({this.leaveResponse});
}

class UpdateStatus extends LeaveState{
  final String? response;
  final Leave? leave;

  UpdateStatus({this.response, this.leave});
}

class LeaveCreate extends LeaveState {
  final String? response;
  final Leave? leave;

  LeaveCreate({this.response, this.leave});


}
class GetTotalLeave extends LeaveState {
  final TotalLeave? totalLeave;

  GetTotalLeave({this.totalLeave});


}