// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'tests.dart';

void main() {
  group("Notifications Api tests", runNotificationsApiTests);

  group("API tests", runApiTests);

  group("User API tests", runApiUserTests);
}
