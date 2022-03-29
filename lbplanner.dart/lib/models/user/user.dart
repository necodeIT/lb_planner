import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// User model
class User with _$User {
  /// User model
  const factory User({
    required String username,
    required String firstname,
    required String lastname,
    required Uri avatar,
    required Languages language,
    required String theme,
    required AccessLevels accessLevel,
  }) = _User;

  /// User model from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
