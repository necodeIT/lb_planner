// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:lbplanner_api/lbplanner_api.dart';

part 'invite.freezed.dart';
part 'invite.g.dart';

@freezed

/// Plan model
class PlanInvite with _$PlanInvite {
  const PlanInvite._();

  /// Plan model
  const factory PlanInvite({
    /// ID of the plan
    required DateTime timeStamp,

    /// The name of the plan
    required int planId,

    /// The id of the user invited to join the plan
    required int invitee,

    /// The id of the user who invited the [invitee]
    required int inviter,

    /// The status of the invite
    required PlanInviteStatus status,
  }) = _PlanInvite;

  /// Plan model from json
  factory PlanInvite.fromJson(Map<String, dynamic> json) => _$PlanInviteFromJson(json);
}
