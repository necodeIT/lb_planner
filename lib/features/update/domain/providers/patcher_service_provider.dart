import 'package:lb_planner/configs/install_medium.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/features/update/data/data.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [PatcherService] instance.
final patcherServiceProvider = Provider<PatcherService>((ref) {
  switch (kInstallMedium) {
    case InstallMedium.aur:
      return AurPatcherService();
    case InstallMedium.selfCompiled:
      return SelfCompiledPatcherService();
    case InstallMedium.innoSetup:
      final downloadService = ref.watch(downloadServiceProvider);

      return InnoSetupPatcherService(downloadService);
    case InstallMedium.appImage:
      return AppImagePatcherService();
    case InstallMedium.dmg:
      final downloadService = ref.watch(downloadServiceProvider);

      return DmgPatcherService(downloadService);
  }
});
