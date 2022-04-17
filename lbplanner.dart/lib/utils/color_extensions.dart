part of lbplanner_api;

/// Provides helper methods for the [Color] type.
extension ColorUtils on Color {
  /// Returns the hexadecimal representation of the color.
  String get hexCode => "#${value.toRadixString(16)}";

  /// Color from hexadecimal representation.
  static Color fromHexCode(String hexCode) => Color(int.parse(hexCode.replaceAll("#", ""), radix: 16));
}
