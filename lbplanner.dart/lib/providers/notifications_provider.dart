part of lbplanner_api;

/// Provides notifications for the current user
final notificationsProvider = StateNotifierProvider<NotificationsProvider, List<Notification>>((ref) => NotificationsProvider(ref.watch(userProvider)));

/// Controller for the notifications.p
final notificationsController = notificationsProvider.notifier;

/// Provides notifications for the current user
class NotificationsProvider extends StateNotifier<List<Notification>> {
  /// The user to get the notifications for
  final User user;

  /// Provides notifications for the current user
  NotificationsProvider(this.user) : super(<Notification>[]);

  /// Gets the notifications for the current user
  Future<RawApiResponse> getAllNotifications() async {
    var response = await NotificationsApi.getAllNotifications(user.token, user.id);

    if (response.succeeded) state = response.value!;

    return response;
  }

  /// Marks all notifications as read
  Future<RawApiResponse> markAllAsRead() async {
    for (var notification in state) {
      if (notification.status == NotificationStatus.unread) {
        var response = await NotificationsApi.updateNotificationStatus(user.token, user.id, notification.id, NotificationStatus.read);

        if (response.failed) return response;
      }
    }

    return getAllNotifications();
  }
}
