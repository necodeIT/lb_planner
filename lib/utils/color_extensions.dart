part of lbplanner_engine;

/// Provides helper methods for the [Color] type.
extension ColorUtils on Color {
  /// Returns the hexadecimal representation of the color.
  String get hexCode => "#${value.toRadixString(16).replaceAll(r"ff", r"")}";

  /// Color from hexadecimal representation.
  static Color fromHexCode(String hexCode) => Color(int.parse(hexCode.replaceAll("#", ""), radix: 16));
}
