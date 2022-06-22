
import 'package:logger/logger.dart';

import '../../Data/Model/Notification/NotificationResponse.dart';
import '../../Network/Notification/notification_network.dart';

class NotificationRepository{
  var logger = Logger();

  Future<NotificationResponse> loadedAllNotification() async{
    final rawx=await NotificationNetwork().loadedAllNotification();
    logger.d(rawx);
    return NotificationResponse.fromJson(rawx);
  }
}