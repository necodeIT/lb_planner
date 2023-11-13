import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/features/auth/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

import 'env.dart';

void main() {
  group("UserDataSource", () {
    final container = ProviderContainer();

    final apiService = container.read(apiServiceProvider);

    group("StdUserDataSource", () {
      final dataSource = StdUserDataSource(apiService, kUserToken);

      test("fetchAllUsers", () async {
        final users = await dataSource.fetchAllUsers();

        expect(users, kFetchAllUsersReturns);
      });

      test("fetchCurrentUser", () async {
        final user = await dataSource.fetchCurrentUser();

        expect(user, kFetchCurrentUserReturns);
      });

      test("updateUser", () async {
        final user = await dataSource.updateUser(kFetchCurrentUserReturns);

        expect(user, kFetchCurrentUserReturns);
      });
    });
    group("TokenUnavailableUserDataSource", () {});
  });
}
