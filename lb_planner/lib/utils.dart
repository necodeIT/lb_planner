import 'dart:convert';

import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_ui/core.dart';
import 'package:crypto/crypto.dart' as crypto;

/// Applies the user's selected theme.
void applyUserTheme(User user) {
  setTheme(NcThemes.all[user.theme] ?? lightTheme);
  setColorBlindness(user.colorBlindness);
}

/// Extensions for [DateTime]
extension DateOnlyCompare on DateTime {
  /// Returns true if this date is the same date as the given [other].
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Returns true if this is today.
  bool get isToday => isSameDate(DateTime.now());
}

/// Extensions for [String].
extension StringExt on String {
  /// Returns the sha256 hash of this string.
  String sha256() {
    var bytes = utf8.encode(this);

    return crypto.sha256.convert(bytes).toString();
  }
}
