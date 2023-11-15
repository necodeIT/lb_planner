import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/features/update/update.dart';

part 'patching_progress.freezed.dart';

/// Represents the progress of patching the current app.
@freezed
class PatchingProgress with _$PatchingProgress {
  /// Represents the progress of patching the current app.
  factory PatchingProgress({
    /// The release that is currently being patched.
    required Release release,

    /// The progress of the patching process.
    required double progress,
  }) = _PatchingProgress;
}
