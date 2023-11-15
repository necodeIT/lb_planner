import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [PatchingProgress].
///
/// NOTE: Resolves to `null` if no patching is in progress.
class PatchingProgressProviderState extends StateNotifier<PatchingProgress?> {
  /// The [PatcherService] instance to use for patching.
  final PatcherService patcherService;

  /// The [ReleaseRepository] instance to use for fetching the latest release.
  final ReleaseRepository releaseRepository;

  /// The latest [Release] available.
  late final Release latest;

  /// Provides the current [PatchingProgress].
  ///
  /// NOTE: Resolves to `null` if no patching is in progress.
  PatchingProgressProviderState(this.patcherService, this.releaseRepository)
      : super(null) {
    releaseRepository.getLatestRelease().then((value) => latest = value);
  }

  /// Downloads and installs the latest version of the app.
  ///
  /// Throws an [UnsupportedError] if [canPatch] returns `false`.
  ///
  /// If the patching fails, the [PatchingProgress] will contain the error and stack trace.
  Future<void> patch() async {
    if (!canPatch) {
      throw UnsupportedError(
        'Automatic patching is not supported with ${patcherService.runtimeType}',
      );
    }

    try {
      await patcherService.patch(
        latest,
        onProgress: (progress) {
          state = PatchingProgress(
            release: latest,
            progress: progress,
          );
        },
      );
    } catch (e, s) {
      state = state?.copyWith(error: e, stackTrace: s) ??
          PatchingProgress(
            release: latest,
            progress: -1,
            error: e,
            stackTrace: s,
          );
    }
  }

  /// Whether the app can be patched automatically.
  ///
  /// If this returns `false`, the user will have to manually install the update.
  ///
  /// In this case [patch] will throw an [UnsupportedError]. Use [getInstructions] to receive instructions for manually installing the update.
  bool get canPatch => patcherService.canPatch;

  /// Returns the instructions for manually installing a given release in markdown format.
  ///
  /// Throws an [UnsupportedError] if [canPatch] returns `true`.
  String getInstructions(BuildContext context) =>
      patcherService.getInstructions(context, latest);
}
