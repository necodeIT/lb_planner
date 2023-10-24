import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/features/update/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ReleaseRepository] instance.
final releaseRepositoryProvider = Provider<ReleaseRepository>((ref) {
  final dataSource = ref.watch(releaseDataSourceProvider);

  return StdReleaseRepository(dataSource: dataSource);
});
