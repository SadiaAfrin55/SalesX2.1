import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Notification/NotificationResponse.dart';
import '../../Repository/Notification/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  var logger = Logger();

  NotificationCubit() : super(NotificationInitial());

  void loadedAllNotification() {
    print("notiifjjj");
    NotificationRepository().loadedAllNotification().then((response) {
      logger.d(response);
      if (response != null) {
        emit(AllNotificationget(notificationResponse: response));
      }
    });
  }

  void loadedYourNotification(String userId) {
    print("notiifjjj");
    NotificationRepository().loadedYourNotification(userId).then((response) {
      logger.d(response);
      if (response != null) {
        emit(AllNotificationget(notificationResponse: response));
      }
    });
  }

}
