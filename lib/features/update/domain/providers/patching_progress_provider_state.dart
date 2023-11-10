import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [PatchingProgress].
///
/// NOTE: Resolves to `null` if no patching is in progress.
class PatchingProgressProviderState extends StateNotifier<PatchingProgress?> {
  /// The [PatcherService] instance to use for patching.
  final PatcherService patcherService;

  /// The [ReleaseRepository] instance to use for fetching releases.
  final ReleaseRepository releaseRepository;

  /// Provides the current [PatchingProgress].
  ///
  /// NOTE: Resolves to `null` if no patching is in progress.
  PatchingProgressProviderState(this.patcherService, this.releaseRepository)
      : super(null);

  /// Downloads and installs the latest version of the app.
  ///
  /// Throws an [UnsupportedError] if [canPatch] returns `false`.
  Future<void> patch() async {
    var latest = await releaseRepository.getLatestRelease();

    await patcherService.patch(
      latest,
      onProgress: (progress) {
        state = PatchingProgress(
          version: latest.version,
          progress: progress,
        );
      },
    );
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
  String getInstructions(BuildContext context, Release release) =>
      patcherService.getInstructions(context, release);
}
