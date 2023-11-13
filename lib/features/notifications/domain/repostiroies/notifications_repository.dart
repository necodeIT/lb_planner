import 'package:lb_planner/features/notifications/notifications.dart';

/// Base class for all notification repositories.
///
/// A notification repository is responsible for fetching, filtering and marking notifications as read.
abstract class NotificationsRepository {
  /// Returns all notifications for the currently logged in user.
  Future<List<Notification>> getNotifications();

  /// Marks the given [notification] as read.
  Future<Notification> markNotificationAsRead(Notification notification);

  /// Marks all notifications as read for the currently logged in user.
  Future<List<Notification>> markAllNotificationsAsRead();

  /// Filters the given [notifications] based on [type] and [read] status.
  ///
  /// If [type] is `null`, all types will be returned.
  /// If [read] is `null`, all read statuses will be returned.
  List<Notification> filterNotifications(
    List<Notification> notifications, {
    NotificationType? type,
    bool? read,
  });
}
