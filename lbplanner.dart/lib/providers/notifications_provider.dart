part of lbplanner_api;

/// Provides notifications for the current user
final notificationsProvider = StateNotifierProvider<NotificationsProvider, Map<int, Notification>>((ref) => NotificationsProvider(ref.watch(userProvider)));

/// Controller for the notifications.p
final notificationsController = notificationsProvider.notifier;

/// Provides notifications for the current user
class NotificationsProvider extends StateNotifier<Map<int, Notification>> with IRefreshable {
  /// The user to get the notifications for
  final User user;

  /// Provides notifications for the current user
  NotificationsProvider(this.user) : super({});

  @override
  init() {
    fetchNotifications();
    startAutoRefresh();
  }

  @override
  onUpdate() => reportRefresh();

  /// Gets the notifications for the current user
  Future<RawApiResponse> fetchNotifications() async {
    var response = await NotificationsApi.getAllNotifications(user.token, user.id);

    if (response.succeeded) setState(Map.fromEntries(response.value!.map((notification) => MapEntry(notification.id, notification))));

    return response;
  }

  /// Marks all notifications as read
  Future<RawApiResponse> markAllAsRead() async {
    for (var notification in state.values) {
      if (notification.status == NotificationStatus.unread) {
        var response = await NotificationsApi.updateNotificationStatus(user.token, user.id, notification.copyWith(status: NotificationStatus.read));

        if (response.failed) return response;
      }
    }

    return fetchNotifications();
  }

  @override
  bool get canRefresh => !user.loading && !user.restricted;

  @override
  onRefresh() => fetchNotifications();

  @override
  dispose() {
    super.dispose();
    stopAutoRefresh();
  }
}
