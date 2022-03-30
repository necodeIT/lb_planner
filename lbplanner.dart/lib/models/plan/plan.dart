import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

part 'plan.freezed.dart';
part 'plan.g.dart';

@freezed

/// Plan model
class Plan with _$Plan {
  const Plan._();

  /// Plan model
  const factory Plan({
    /// ID of the plan
    required int id,

    /// The name of the plan
    required String name,

    /// The description of the plan
    required String description,

    /// Planmembers of the plan
    required Map<int, PlanAccessTypes> members,

    /// The invites of the plan
    required List<PlanInvite> invites,
  }) = _Plan;

  /// Plan model from json
  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
