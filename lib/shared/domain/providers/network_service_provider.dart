import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';

import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/shared/data/data.dart';

/// Provides the current [NetworkService] instance.
///
/// See [NetworkService] for more information.
final networkServiceProvider = Provider<NetworkService>((ref) {
  final dio = Dio();

  return DioNetworkService(dio);
});
