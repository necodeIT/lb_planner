part of lbplanner_engine;

/// DateTime extensions.
extension DateTimeExtensions on DateTime {
  /// Returns [this] as a unix timestamp.
  int get unixTimestamp => millisecondsSinceEpoch ~/ 1000;

  /// Creates a [DateTime] from a unix timestamp.
  static DateTime fromUnixTimestamp(int timestamp) => DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}
