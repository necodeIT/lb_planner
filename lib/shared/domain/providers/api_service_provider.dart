import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ApiService] instance for the given token.
final apiServiceProvider = Provider<ApiService>((ref) {
  final networkService = ref.watch(networkServiceProvider);

  return MoodleApiService(networkService);
});
