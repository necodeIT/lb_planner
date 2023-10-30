import 'dart:io';

import 'package:lb_planner/configs/version.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

/// Implements [PatcherService] for the [InstallMedium.dmg] install medium.
class DmgPatcherService extends PatcherService {
  /// The [DownloadService] used to download the update.
  final DownloadService downloadService;

  /// Implements [PatcherService] for the [InstallMedium.innoSetup] install medium.
  DmgPatcherService(this.downloadService);

  @override
  bool get canPatch => true;

  @override
  Future<void> patch(
    Release release, {
    void Function(double progress)? onProgress,
  }) async {
    final setup = await downloadService.download(
      release.downloads.macos,
      "$kAppName ${release.versionString}.dmg",
      onProgress: (_, __, progess) => onProgress?.call(progess),
    );

    await Process.start(setup.absolute.path, []);

    exit(0);
  }
}
