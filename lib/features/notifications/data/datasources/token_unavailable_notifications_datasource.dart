import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:logging/logging.dart';

/// Implementation of [NotificationsDataSource] when the user is not logged in.
///
/// This will ony return empty lists and not actually fetch any data.
class TokenUnavailableNotificationsDataSource extends NotificationsDataSource {
  /// The logger to use.
  final Logger log =
      Logger('NotificationsDataSource.TokenUnavailableNotificationsDataSource');

  @override
  Future<List<Notification>> fetchNotifications() async {
    log.warning(
      "Tried to fetch notifications when the user is not logged in. This should not happen.",
    );

    return [];
  }

  @override
  Future<Notification> updateNotification(Notification notification) async {
    log.warning(
      "Tried to update notifications when the user is not logged in. This should not happen.",
    );

    return notification;
  }
}
