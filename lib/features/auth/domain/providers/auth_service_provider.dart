import 'package:lb_planner/features/auth/domain/services/moodle_auth_service.dart';
import 'package:lb_planner/features/auth/domain/services/services.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// The name of the web service for the LB Planner API.
const kLbPlannerApiServiceName = 'lb_planner_api';

/// The name of the web service for the Moodle Mobile App.
const kMoodleMobileAppApiServiceName = 'moodle_mobile_app_api';

/// Provides the current [AuthService] instance for the given web service name.
///
/// Refer to [kLbPlannerApiServiceName] and [kMoodleMobileAppApiServiceName] for the available web service names.
final authServiceProvider =
    Provider.family<AuthService, String>((ref, webService) {
  final networkService = ref.watch(networkServiceProvider);

  return MoodleAuthService(webService, networkService);
});
