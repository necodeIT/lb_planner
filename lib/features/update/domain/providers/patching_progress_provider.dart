import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [PatchingProgress].
///
/// NOTE: Resolves to `null` if no patching is in progress.
///
/// To start patching or get instructions, use [patchingProgressController].
final patchingProgressProvider =
    StateNotifierProvider<PatchingProgressProviderState, PatchingProgress?>(
  (ref) {
    final patcherService = ref.watch(patcherServiceProvider);
    final updateChecker = ref.watch(updateCheckerProvider);

    return PatchingProgressProviderState(
      patcherService,
      updateChecker.latestRelease,
    );
  },
);

/// Expososes the controller for [patchingProgressProvider].
///
/// To receive updates on the patching progress, use [patchingProgressProvider].
final patchingProgressController = patchingProgressProvider.notifier;
