import 'package:lb_planner/features/auth/domain/domain.dart';
import 'package:lb_planner/features/auth/data/services/user_token_local_config_service.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [LocalConfigService] instance for [UserToken].
final userTokenLocalConfigServiceProvider =
    Provider<LocalConfigService<UserToken>>((ref) {
  final appDirService = ref.watch(appDirServiceProvider);

  return UserTokenLocalConfigService(appDirService);
});
