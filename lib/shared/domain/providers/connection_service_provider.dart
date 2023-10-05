import 'dart:async';

import 'package:riverpod/riverpod.dart';

import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/utils/auto_refresh_state_notifier.dart';

/// Provides the current connection status of the device.
final connectionServiceProvider = Provider<_ConnectionProvider>((ref) {
  final connectionService = InternetAdressLookupConnectionService();

  return _ConnectionProvider(connectionService);
});

class _ConnectionProvider extends AutoRefreshStateNotifier<bool> {
  final ConnectionService connectionService;

  _ConnectionProvider(this.connectionService) : super(true);

  @override
  FutureOr<bool> onRefresh() => connectionService.checkConnection();
}
