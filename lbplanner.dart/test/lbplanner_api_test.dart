import 'package:flutter_test/flutter_test.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

void main() {
  test("Empty user", () {
    expect(User.empty().isEmpty, true);
  });
}
