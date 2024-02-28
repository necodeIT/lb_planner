import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/shared/shared.dart';

/// Implementation of [NotificationsDataSource] when the user is not logged in.
///
/// This will ony return empty lists and not actually fetch any data.
class TokenUnavailableNotificationsDataSource extends NotificationsDataSource
    with StubWarnMixin {
  @override
  Future<List<Notification>> fetchNotifications() async {
    warn("fetchNotifications");

    return [];
  }

  @override
  Future<Notification> updateNotification(Notification notification) async {
    warn("updateNotification");

    return notification;
  }
}
