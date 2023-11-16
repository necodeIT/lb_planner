import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the progress of the current patching process.
///
/// The progess is represented as double between `0.0` and `1.0`.
///
/// NOTE: Resolves to `null` if no patching is in progress.
///
/// If this resolves to [AsyncLoading] the patcher is currently being initialized and it unsafe to use any properties or methods.
///
/// If this resolves to [AsyncError], there was an error while patching or an error during setup, which also makes it unsafe to call any methods or use any properties.
class PatchingProgressProviderState extends AsyncNotifier<double?> {
  late PatcherService _patcherService;

  late ReleaseRepository _releaseRepository;

  late Release _target;

  /// The target release that should be installed.
  Release get target => _target;

  /// Provides the current [PatchingProgress].
  ///
  /// NOTE: Resolves to `null` if no patching is in progress.
  PatchingProgressProviderState();

  @override
  FutureOr<double?> build() async {
    _patcherService = ref.read(patcherServiceProvider);

    _releaseRepository = ref.read(releaseRepositoryProvider);

    // watch `isUpdateAvailableProvider` so we refetch the lateste release when [IsUpdateAvailableProviderState.checkForUpdates] is called
    //
    // this way we ensure that we always have the latest release when patching
    ref.watch(isUpdateAvailableProvider);

    _target = await _releaseRepository.getLatestRelease();

    return null;
  }

  /// Downloads and installs the latest version of the app.
  ///
  /// NOTE: [state] will resolve to an [AsyncError] if [canPatch] returns `false`.
  Future<void> patch() async {
    state = await AsyncValue.guard(() async {
      if (!canPatch) {
        throw UnsupportedError(
          '${_patcherService.runtimeType} does not support patching.',
        );
      }

      await _patcherService.patch(
        target,
        onProgress: (progress) {
          state = AsyncValue.data(progress);
        },
      );

      return null;
    });
  }

  /// Whether the app can be patched automatically.
  ///
  /// If this returns `false`, the user will have to manually install the update.
  ///
  /// In this case [patch] will throw an [UnsupportedError]. Use [getInstructions] to receive instructions for manually installing the update.
  bool get canPatch => _patcherService.canPatch;

  /// Returns the instructions for manually installing a given release in markdown format.
  ///
  /// NOTE: [state] will resolve to an [AsyncError] if [canPatch] returns `true`.
  String getInstructions(BuildContext context) =>
      _patcherService.getInstructions(context, target);
}
