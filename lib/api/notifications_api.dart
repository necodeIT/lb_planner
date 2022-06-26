part of lbplanner_engine;

/// Notifications API
class NotificationsApi {
  /// Retrieves all notifications for the given [userId].
  static Future<ApiResponse<List<Notification>>> getAllNotifications(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_notifications_get_all_notifications",
      token: token,
      params: {
        "userid": userId,
      },
    );

    List<Notification>? notifications = [];

    if (response.succeeded) {
      notifications = [];

      for (var notification in response[kApiListContent]) {
        var notificationMap = Map<String, dynamic>.of(notification);

        notifications.add(Notification.fromJson(notificationMap.mapNotification()));
      }
    }

    return ApiResponse(response.response, notifications);
  }

  /// Updates the notification with the given [notificationId] to the given [status].
  static Future<ApiResponse<Notification>> updateNotificationStatus(String token, int userId, Notification data) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_notifications_update_notification",
      token: token,
      params: {
        "notificationid": data.id,
        "status": data.status.index,
        "userid": userId,
      },
    );

    Notification? notification;

    if (response.succeeded) notification = Notification.fromJson(response.body.mapNotification());

    return ApiResponse(response.response, notification);
  }
}
