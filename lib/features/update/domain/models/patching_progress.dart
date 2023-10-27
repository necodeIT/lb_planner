import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/shared/shared.dart';

part 'patching_progress.freezed.dart';

@freezed
class PatchingProgress with _$PatchingProgress {
  factory PatchingProgress({
    /// The version that is being patched.
    required Version version,

    /// The progress of the patching process.
    required double progress,
  }) = _PatchingProgress;
}
