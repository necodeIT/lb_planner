import 'package:flutter/material.dart';

/// Holds theme information for module status.
class ModuleStatusTheme extends ThemeExtension<ModuleStatusTheme> {
  /// Holds theme information for module status.
  ModuleStatusTheme({
    required this.pendingColor,
    required this.uploadedColor,
    required this.lateColor,
    required this.doneColor,
  });

  /// The color for pending modules.
  final Color pendingColor;

  /// The color for uploaded modules.
  final Color uploadedColor;

  /// The color for late modules.
  final Color lateColor;

  /// The color for done modules.
  final Color doneColor;

  /// Returns the [ModuleStatusTheme] for the given [context].
  static ModuleStatusTheme of(BuildContext context) =>
      Theme.of(context).extension<ModuleStatusTheme>()!;

  @override
  ThemeExtension<ModuleStatusTheme> copyWith({
    Color? pendingColor,
    Color? uploadedColor,
    Color? lateColor,
    Color? doneColor,
  }) {
    return ModuleStatusTheme(
      pendingColor: pendingColor ?? this.pendingColor,
      uploadedColor: uploadedColor ?? this.uploadedColor,
      lateColor: lateColor ?? this.lateColor,
      doneColor: doneColor ?? this.doneColor,
    );
  }

  @override
  ThemeExtension<ModuleStatusTheme> lerp(
      covariant ThemeExtension<ModuleStatusTheme>? other, double t) {
    if (other is! ModuleStatusTheme) {
      return this;
    }

    return ModuleStatusTheme(
      pendingColor: Color.lerp(pendingColor, other.pendingColor, t)!,
      uploadedColor: Color.lerp(uploadedColor, other.uploadedColor, t)!,
      lateColor: Color.lerp(lateColor, other.lateColor, t)!,
      doneColor: Color.lerp(doneColor, other.doneColor, t)!,
    );
  }
}
