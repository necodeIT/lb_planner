import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

/// Implements [PatcherService] for the [InstallMedium.innoSetup] install medium.
class SelfCompiledPatcherService extends PatcherService {
  @override
  bool get canPatch => false;

  @override
  String getInstructions(BuildContext context, Release release) {
    return AppLocalizations.of(context)!.update_instructions_selfCompiled;
  }
}
