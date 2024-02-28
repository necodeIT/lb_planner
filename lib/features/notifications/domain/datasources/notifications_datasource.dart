import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all notification datasources.
///
/// A notification datasource is responsible for fetching and updating notifications.
abstract class NotificationsDataSource extends DataSource {
  /// Initializes a new instance of [NotificationsDataSource] with logging set up.
  NotificationsDataSource() : super("Notifications");

  /// Fetches all notifications for the currently logged in user.
  Future<List<Notification>> fetchNotifications();

  /// Updates a notification by posting the updated [notification] to the server.
  ///
  /// Returns the updated notification from the server.
  Future<Notification> updateNotification(Notification notification);
}
