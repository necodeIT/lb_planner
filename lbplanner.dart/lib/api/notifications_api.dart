part of lbplanner_api;

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
}
