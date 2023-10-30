import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

/// Implements [PatcherService] for the [InstallMedium.appImage] install medium.
class AppImagePatcherService extends PatcherService {
  @override
  bool get canPatch => false;

  @override
  String getInstructions(BuildContext context, Release release) {
    // TODO: verify currentAppImage path

    return AppLocalizations.of(context)!.update_instructions_appImage(
      Platform.resolvedExecutable,
      release.downloads.linux,
    );
  }
}
