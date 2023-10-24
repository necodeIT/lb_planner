import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/features/update/data/data.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

final releaseDataSourceProvider = Provider<ReleaseDataSource>((ref) {
  final networkService = ref.watch(networkServiceProvider);

  return StdReleaseDataSource(networkService: networkService);
});
