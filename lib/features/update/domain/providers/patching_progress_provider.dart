import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the progress of the current patching process.
///
/// The progess is represented as double between `0.0` and `1.0`.
///
/// NOTE: Resolves to `null` if no patching is in progress.
///
/// If you want start a patching process, use [patchingProgressController].
final patchingProgressProvider =
    AsyncNotifierProvider<PatchingProgressProviderState, double?>(
  () => PatchingProgressProviderState(),
);

/// Exposes methods for patching the app.
///
/// If [patchingProgressProvider] resolves to [AsyncLoading], the patcher is currently being initialized and it unsafe to use any properties or methods.
///
/// If [patchingProgressProvider] resolves to [AsyncError], there was an error while patching or an error during setup, which also makes it unsafe to call any methods or use any properties.
///
/// If you want to read the current patching progress, use [patchingProgressProvider].
final patchingProgressController = patchingProgressProvider.notifier;
