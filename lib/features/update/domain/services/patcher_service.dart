import 'package:flutter/material.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all patcher services.
///
/// A patcher service is responsible for downloading and installing updates.
///
/// NOTE: Depending on the way the app was installed, updates may have to be installed manually. In this case [canPatch] will return `false`.
abstract class PatcherService extends Service {
  const PatcherService() : super("Patcher");

  /// Downloads and installs a given release.
  ///
  /// Use [onProgress] to get the progress of the download in percent. `progress` is a value between `0` and `1`.
  ///
  /// Throws an [UnsupportedError] if [canPatch] returns `false`.
  Future<void> patch(
    Release release, {
    void Function(double progress)? onProgress,
  }) =>
      throw UnsupportedError(
        "Can't patch, as patching is not supported.",
      );

  /// Whether the app can be patched automatically.
  ///
  /// If this returns `false`, the user will have to manually install the update.
  ///
  /// In this case [patch] will throw an [UnsupportedError]. Use [getInstructions] to get instructions for manually installing the update.
  bool get canPatch;

  /// Returns the instructions for manually installing a given release in markdown format.
  ///
  /// Throws an [UnsupportedError] if [canPatch] returns `true`.
  String getInstructions(BuildContext context, Release release) =>
      throw UnsupportedError(
        "Can't get instructions for patching, as patching is supported.",
      );
}
