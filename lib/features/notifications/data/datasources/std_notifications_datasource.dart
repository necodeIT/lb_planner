import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/shared/shared.dart';

/// Standard implementation of [NotificationsDataSource].
class StdNotificationsDataSource extends NotificationsDataSource {
  /// The [ApiService] to use for fetching and updating notifications.
  final ApiService apiService;

  /// The [UserToken] needed to use the [apiService].
  final UserToken token;

  /// Standard implementation of [NotificationsDataSource].
  StdNotificationsDataSource(this.apiService, this.token);

  @override
  Future<List<Notification>> fetchNotifications() async {
    log("Fetching all notifications");

    final response = await apiService.callFunction(
      function: "local_lbplanner_notifications_get_all_notifications",
      token: token.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      log("Failed to fetch notifications", response.body);

      throw Exception(
        "Failed to fetch notifications with status code ${response.statusCode}",
      );
    }

    final json = response.expectMultiple();

    log("Fetched ${json.length} notifications");

    return json.map((e) => Notification.fromJson(e)).toList();
  }

  @override
  Future<Notification> updateNotification(Notification notification) async {
    log("Updating notification#$notification");

    final response = await apiService.callFunction(
      function: "local_lbplanner_notifications_update_notification",
      token: token.lbPlannerApiToken,
      body: {
        "notificationid": notification.id,
        "status": notification.readAsInt,
      },
    );

    if (response.failed) {
      log("Failed to update notification#$notification", response.body);

      throw Exception(
        "Failed to update notification with status code ${response.statusCode}",
      );
    }

    final json = response.expectSingle();

    log("Updated notification#$notification");

    return Notification.fromJson(json);
  }
}
