import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_token.freezed.dart';
part 'user_token.g.dart';

/// Holds the user's tokens
@freezed
class UserToken with _$UserToken {
  /// Holds the user's tokens
  factory UserToken({
    /// The token for the moodle_mobile_app web service
    ///
    /// This is used when utilizing the Moodle Mobile App web service
    required String moodleMobileAppToken,

    /// The token for the lbpa (LB Planner API) web service
    ///
    /// This is used when utilizing the LB Planner API
    required String lbPlannerApiToken,
  }) = _UserToken;

  /// [UserToken] from json
  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);
}
