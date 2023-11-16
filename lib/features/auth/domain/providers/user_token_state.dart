import 'dart:async';

import 'package:lb_planner/features/auth/domain/domain.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// The state of [userTokenProvider]
class UserTokenState extends AsyncNotifier<UserToken> {
  /// The [LocalConfigService] used to load and save the user token.
  late LocalConfigService<UserToken> localConfigService;

  /// The [AuthService] used to authenticate for the Moodle Mobile App API.
  late AuthService moodleMobileAppAuthService;

  /// The [AuthService] used to authenticate for the LB Planner API.
  late AuthService lbPlannerApiAuthService;

  @override
  FutureOr<UserToken> build() async {
    localConfigService = ref.watch(userTokenLocalConfigServiceProvider);
    moodleMobileAppAuthService =
        ref.watch(authServiceProvider(kMoodleMobileAppServiceName));
    lbPlannerApiAuthService =
        ref.watch(authServiceProvider(kLbPlannerApiServiceName));

    if (!await localConfigService.canLoadConfig()) {
      throw StateError(
          "Could not load user tokens, as the file config file does not exist");
    }

    var tokens = await localConfigService.loadConfig();

    var moodleValid = await moodleMobileAppAuthService
        .validateToken(tokens.moodleMobileAppToken);
    var lbPlannerValid =
        await lbPlannerApiAuthService.validateToken(tokens.lbPlannerApiToken);

    if (!lbPlannerValid || !moodleValid) {
      throw StateError("Found invalid user tokens, please re-authenticate");
    }

    return tokens;
  }

  /// Logs the user out.
  ///
  /// If you want to log in the user see [login].
  Future<void> logout() async {
    state = AsyncLoading();

    await localConfigService.deleteConfig();

    state = AsyncError("User logged out", StackTrace.current);
  }

  /// Logs the user in.
  ///
  /// This method will attempt to log the user in with the given [username] and [password].
  Future<void> login(String username, String password) async {
    state = AsyncLoading();

    state = await AsyncValue.guard(() async {
      var moodleMobileAppToken =
          await moodleMobileAppAuthService.requestToken(username, password);
      var lbPlannerApiToken =
          await lbPlannerApiAuthService.requestToken(username, password);

      var tokens = UserToken(
          moodleMobileAppToken: moodleMobileAppToken,
          lbPlannerApiToken: lbPlannerApiToken);

      await localConfigService.saveConfig(tokens);

      return tokens;
    });
  }
}
