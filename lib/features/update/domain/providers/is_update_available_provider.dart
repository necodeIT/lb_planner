import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides whether an update is available.
///
/// Resolves to `true` if an update is available, `false` otherwise.
///
/// - To re-check for updates, use [updateCheckerProvider].
final isUpdateAvailableProvider =
    AsyncNotifierProvider<IsUpdateAvailableProviderState, bool>(
  () => IsUpdateAvailableProviderState(),
);

/// Provides methods for re-checking for updates.
///
/// Use [isUpdateAvailableProvider] to get the current update status.
final updateCheckerProvider = isUpdateAvailableProvider.notifier;
