import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';

/// Base class for all patcher services.
///
/// A patcher service is responsible for downloading and installing updates.
///
/// NOTE: Depending on the way the app was installed, updates may have to be installed manually. In this case [canPatch] will return `false`.
abstract class PatcherService {
  /// Downloads and installs a given release.
  ///
  /// Returns a stream of the download progress.
  ///
  /// Throws an [UnsupportedError] if [canPatch] returns `false`.
  Stream<double> patch(Release release);

  /// Whether the app can be patched automatically.
  ///
  /// If this returns `false`, the user will have to manually install the update.
  ///
  /// In this case [patch] will throw an [UnsupportedError]. Use [getInstructions] to get instructions for manually installing the update.
  bool get canPatch;

  /// Returns the instructions for manually installing a given release in markdown format.
  ///
  /// If [canPatch] returns `true`, this will throw an [UnsupportedError].
  String getInstructions(BuildContext context, Release release);
}
