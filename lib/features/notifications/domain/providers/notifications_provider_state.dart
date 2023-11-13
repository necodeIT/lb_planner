import 'dart:async';

import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/shared/shared.dart';

/// Provides all [Notification]s for the current user.
class NotificationsProviderState
    extends AutoRefreshStateNotifier<List<Notification>> {
  /// Provides all [Notification]s for the current user.
  NotificationsProviderState(this.notificationsRepository)
      : super(<Notification>[]);

  /// The [NotificationsRepository] to use for receiving notifications.
  final NotificationsRepository notificationsRepository;

  @override
  FutureOr<List<Notification>> onRefresh() =>
      notificationsRepository.getNotifications();

  /// Marks all of the user's notifications as read.
  Future<void> markAllAsRead() async {
    await notificationsRepository.markAllNotificationsAsRead();
  }

  /// Filters the user's notifications by [type] and [read] status.
  ///
  /// If [type] is `null`, all types will be returned.
  /// If [read] is `null`, all read statuses will be returned.
  List<Notification> filterBy({NotificationType? type, bool? read}) {
    return notificationsRepository.filterNotifications(
      state,
      type: type,
      read: read,
    );
  }
}
