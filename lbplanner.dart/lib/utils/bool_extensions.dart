part of lbplanner_api;

/// Provides helper methods for the [bool] type.
extension BoolUtils on bool {
  /// Returns 0 if false, 1 if true.
  int get intValue => this ? 1 : 0;

  /// Returns a boolean value from an integer.
  static bool fromInt(int value) => value == 1;
}
