import 'package:flutter_test/flutter_test.dart';

import 'tests.dart';

void main() {
  group("API tests", runApiTests);

  group("User API tests", runApiUserTests);
}
