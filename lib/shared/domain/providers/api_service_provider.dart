import 'dart:async';

import 'package:lb_planner/shared/domain/models/models.dart';
import 'package:lb_planner/shared/domain/providers/providers.dart';
import 'package:lb_planner/shared/domain/services/moodle_api_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:lb_planner/shared/domain/services/services.dart';

/// Provides the current [ApiService] instance for the given [token].
final apiServiceProvider = Provider.family<_ApiService, String>((ref, token) {
  final networkService = ref.watch(netwokServiceProvider);
  final apiService = MoodleApiService(networkService);

  return _ApiService(apiService, token);
});

class _ApiService {
  final ApiService apiService;
  final String token;

  _ApiService(this.apiService, this.token);

  /// Calls the specified [function] with the given [body] and returns the response.
  Future<HttpResponse<JSON>> callFunction(
      {required String function, required body, bool redact = false}) {
    return apiService.callFunction(
        function: function, token: token, body: body, redact: redact);
  }
}
