import 'dart:async';

import 'package:lb_planner/shared/domain/services/internet_address_lookup_connection_service.dart';
import 'package:lb_planner/shared/utils/auto_refresh_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:lb_planner/shared/domain/services/services.dart';

/// Provides the current [NetworkService] instance.
///
/// See [NetworkService] for more information.
final netwokServiceProvider = Provider<_ConnectionProvider>((ref) {
  final connectionService = InternetAdressLookupConnectionService();

  return _ConnectionProvider(connectionService);
});

class _ConnectionProvider extends AutoRefreshStateNotifier<bool> {
  final ConnectionService connectionService;

  _ConnectionProvider(this.connectionService) : super(true);

  @override
  FutureOr<bool> onRefresh() => connectionService.checkConnection();
}
