import 'package:lb_planner/features/notifications/notifications.dart';

/// Standard implementation of [NotificationsRepository].
class StdNotificationsRepository extends NotificationsRepository {
  /// The [NotificationsDataSource] to use for fetching and updating notifications.
  final NotificationsDataSource notificationsDataSource;

  /// Standard implementation of [NotificationsRepository].
  StdNotificationsRepository(this.notificationsDataSource);

  @override
  List<Notification> filterNotifications(
    List<Notification> notifications, {
    NotificationType? type,
    bool? read,
  }) {
    return notifications.where((notification) {
      if (type != null && notification.type != type) {
        return false;
      }

      if (read != null && notification.read != read) {
        return false;
      }

      return true;
    }).toList();
  }

  @override
  Future<List<Notification>> getNotifications() =>
      notificationsDataSource.fetchNotifications();

  @override
  Future<List<Notification>> markAllNotificationsAsRead() async {
    final notifications = await getNotifications();

    return Future.wait(notifications.map((notification) async {
      if (notification.read) {
        return notification;
      }

      return await markNotificationAsRead(notification);
    }));
  }

  @override
  Future<Notification> markNotificationAsRead(Notification notification) async {
    if (notification.read) {
      return notification;
    }

    return notificationsDataSource.updateNotification(notification.copyWith(
      readAsInt: 1,
      readAtTimestamp: DateTime.now().millisecondsSinceEpoch,
    ));
  }
}
