part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class AllNotificationget extends NotificationState{
  final NotificationResponse notificationResponse;

  AllNotificationget({required this.notificationResponse});
}
