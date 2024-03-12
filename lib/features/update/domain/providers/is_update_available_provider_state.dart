import 'dart:async';

import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides whether an update is available.
///
/// Resolves to `true` if an update is available, `false` otherwise.
class IsUpdateAvailableProviderState extends AsyncNotifier<bool> {
  /// The [ReleaseRepository] instance to use.
  late final ReleaseRepository releaseRepository;

  late Release _latestRelease;

  /// The latest release published.
  ///
  /// Updates when [checkForUpdates] is called.
  Release get latestRelease => _latestRelease;

  @override
  FutureOr<bool> build() async {
    releaseRepository = ref.watch(releaseRepositoryProvider);

    return _checkForUpdates();
  }

  /// Checks if a new release has been published.
  Future<void> checkForUpdates() async {
    state = AsyncLoading();

    state = await AsyncValue.guard(_checkForUpdates);
  }

  /// INTERNAL USE ONLY!
  ///
  /// Checks whether an update is available.
  ///
  /// Called by [build] and [checkForUpdates].
  Future<bool> _checkForUpdates() async {
    _latestRelease = await releaseRepository.getLatestRelease();

    return releaseRepository.isUpdateAvailable();
  }
}
