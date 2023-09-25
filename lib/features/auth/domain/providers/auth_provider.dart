import 'package:lb_planner/features/auth/domain/services/moodle_auth_service.dart';
import 'package:lb_planner/features/auth/domain/services/services.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [AuthService] for the given service.
final authServiceProvider =
    Provider.family<AuthService, String>((ref, webservice) {
  final networkService = ref.watch(netwokServiceProvider);

  return MoodleAuthService(webservice, networkService);
});
