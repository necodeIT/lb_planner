/// Provides some useful extensions for [String] class.
extension StringUtils on String {
  /// Capitalizes the first letter of the string.
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Returns `true` if the string contains the given [other] string, ignoring case.
  bool containsIgnoreCase(String other) {
    return toLowerCase().contains(other.toLowerCase());
  }
}
