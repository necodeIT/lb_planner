import 'dart:io';

import 'package:lb_planner/configs/version.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

/// Implements [PatcherService] for the [InstallMedium.innoSetup] install medium.
class InnoSetupPatcherService extends PatcherService {
  /// The [DownloadService] used to download the update.
  final DownloadService downloadService;

  /// Implements [PatcherService] for the [InstallMedium.innoSetup] install medium.
  InnoSetupPatcherService(this.downloadService);

  @override
  bool get canPatch => true;

  @override
  Future<void> patch(
    Release release, {
    void Function(double progress)? onProgress,
  }) async {
    log("Patching application...");

    final setup = await downloadService.download(
      release.downloads.windows,
      "$kAppName Setup ${release.versionString}.exe",
      onProgress: (_, __, progess) => onProgress?.call(progess),
    );

    log("Installer downloaded to ${setup.absolute.path}.");
    log("Launching installer...");

    await Process.start(setup.absolute.path, []);

    log("Installer launched. Exiting application...");

    exit(0);
  }
}
