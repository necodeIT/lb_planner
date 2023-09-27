import 'dart:async';

import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ApiService] instance for the given token.
final apiServiceProvider = Provider.family<_ApiService, String>((ref, token) {
  final networkService = ref.watch(networkServiceProvider);
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
