import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/features/notifications/data/data.dart';

import 'package:riverpod/riverpod.dart';

/// Provides the current [NotificationsRepository] instance.
final notificationsRepositoryProvider = Provider<NotificationsRepository>(
  (ref) {
    final notificationsDataSource = ref.watch(notificationsDataSourceProvider);

    return StdNotificationsRepository(notificationsDataSource);
  },
);
