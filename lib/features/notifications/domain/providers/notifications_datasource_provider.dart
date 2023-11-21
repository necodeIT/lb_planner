import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/features/notifications/data/data.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

import 'package:riverpod/riverpod.dart';

/// Provides the current [NotificationsDataSource] instance.
final notificationsDataSourceProvider = Provider<NotificationsDataSource>(
  (ref) {
    final apiService = ref.watch(apiServiceProvider);
    final token = ref.watch(userTokenProvider);

    if (!token.hasValue) return TokenUnavailableNotificationsDataSource();

    return StdNotificationsDataSource(apiService, token.requireValue);
  },
);
