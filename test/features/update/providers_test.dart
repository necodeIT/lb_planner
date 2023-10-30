import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/features/update/data/data.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  group("isUpdateAvailableProvider", () {
    final container = ProviderContainer();

    test("should be of type AsyncValue<bool>", () {
      final isUpdateAvailable = container.read(isUpdateAvailableProvider);

      expect(isUpdateAvailable, isA<AsyncValue<bool>>());
    });

    test("should be of type IsUpdateAvailableProviderState", () {
      final controller = container.read(updateCheckerProvider);

      expect(controller, isA<IsUpdateAvailableProviderState>());
    });
  });

  group("patcherServiceProvider", () {
    final container = ProviderContainer();

    test("should be of type PatcherService", () {
      final patcherService = container.read(patcherServiceProvider);

      expect(patcherService, isA<PatcherService>());
    });
  });

  group("releaseDataSourceProvider", () {
    final container = ProviderContainer();

    test("should be of type ReleaseDataSource", () {
      final releaseDataSource = container.read(releaseDataSourceProvider);

      expect(releaseDataSource, isA<ReleaseDataSource>());
    });

    test("should be of type StdReleaseDataSource", () {
      final releaseDataSource = container.read(releaseDataSourceProvider);

      expect(releaseDataSource, isA<StdReleaseDataSource>());
    });
  });

  group("releaseRepositoryProvider", () {
    final container = ProviderContainer();

    test("should be of type ReleaseRepository", () {
      final releaseRepository = container.read(releaseRepositoryProvider);

      expect(releaseRepository, isA<ReleaseRepository>());
    });

    test("should be of type StdReleaseRepository", () {
      final releaseRepository = container.read(releaseRepositoryProvider);

      expect(releaseRepository, isA<StdReleaseRepository>());
    });
  });

  group("patchingProgressProvider", () {
    final container = ProviderContainer();

    test("should be null as no patch is in progress", () {
      final patchingProgress = container.read(patchingProgressProvider);

      expect(patchingProgress, isNull);
    });

    group("patchingProgressController", () {
      test("should be of type PatchingProgressProviderState", () {
        final controller = container.read(patchingProgressController);

        expect(controller, isA<PatchingProgressProviderState>());
      });
    });
  });
}
