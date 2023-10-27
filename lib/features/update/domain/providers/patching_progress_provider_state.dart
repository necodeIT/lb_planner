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

  /// Starts patching the current app.
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
}
