import 'package:lb_planner/features/notifications/notifications.dart';

import 'package:riverpod/riverpod.dart';

/// Provides all notifications for the current user.
///
/// To mark all notifications as read or filter them, use [notificationsController].
final notificationsProvider =
    StateNotifierProvider<NotificationsProviderState, List<Notification>>(
        (ref) {
  final notificationsRepository = ref.watch(notificationsRepositoryProvider);

  return NotificationsProviderState(notificationsRepository);
});

/// Exposes methods for manipulating the user's notifications.
///
/// See [NotificationsProviderState] for more information.
///
/// If you just want to access the notifications, use [notificationsProvider].
final notificationsController = notificationsProvider.notifier;
