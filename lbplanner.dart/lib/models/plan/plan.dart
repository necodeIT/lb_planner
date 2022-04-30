// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
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

    /// Planmembers of the plan
    /// Key: user id
    /// Value: [PlanAccessTypes]
    required Map<int, PlanAccessTypes> members,

    /// The deadlines this plan has.
    /// Key: Module id
    /// Value: [Deadline]
    required Map<int, Deadline> deadlines,

    /// Wheter the plan has modules of type [ModuleTypes.ek] enabled
    required bool ekEnabled,
  }) = _Plan;

  /// Plan model from json
  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
