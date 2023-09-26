import 'dart:convert';

import 'package:lb_planner/features/auth/domain/models/user_token.dart';
import 'package:lb_planner/shared/shared.dart';

/// Implements [LocalConfigService] for [UserToken].
class UserTokenLocalConfigService extends LocalConfigService<UserToken> {
  /// Implements [LocalConfigService] for [UserToken].
  UserTokenLocalConfigService(AppDirService appDirService)
      : super(appDirService, 'tokens.json');

  @override
  Future<UserToken> loadConfig() async {
    var f = await resolveConfigFile();

    var contents = f.readAsStringSync();

    return UserToken.fromJson(jsonDecode(contents));
  }

  @override
  Future<void> saveConfig(UserToken config) async {
    var f = await resolveConfigFile();

    return f.writeAsStringSync(jsonEncode(config.toJson()));
  }
}
