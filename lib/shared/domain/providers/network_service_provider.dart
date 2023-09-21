import 'package:lb_planner/shared/domain/services/dio_network_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:lb_planner/shared/domain/services/services.dart';
import 'package:dio/dio.dart';

/// Provides the current [NetworkService] instance.
///
/// See [NetworkService] for more information.
final netwokServiceProvider = Provider<NetworkService>((ref) {
  final dio = Dio();

  return DioNetworkService(dio);
});
