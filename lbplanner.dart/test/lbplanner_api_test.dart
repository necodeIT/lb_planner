// Package imports:
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'tests.dart';

void main() {
  group("API tests", runApiTests);

  group("User API tests", runApiUserTests);
}
