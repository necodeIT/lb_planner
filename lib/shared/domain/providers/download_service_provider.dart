import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [DownloadService] instance.
final downloadServiceProvider = Provider<DownloadService>((ref) {
  final dio = Dio();

  return DioDownloadService(dio);
});
