import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/shared/shared.dart';

part 'patching_progress.freezed.dart';

/// Represents the progress of patching the current app.
@freezed
class PatchingProgress with _$PatchingProgress {
  /// Represents the progress of patching the current app.
  factory PatchingProgress({
    /// The version that is being patched.
    required Version version,

    /// The progress of the patching process.
    required double progress,
  }) = _PatchingProgress;
}
