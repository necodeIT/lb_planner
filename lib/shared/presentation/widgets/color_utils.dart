import 'package:flutter/material.dart';

/// Utilitiy class to work with colors.
extension ColorUtils on Color {
  /// Returns a new [Color] darkened by the given [amount].
  ///
  /// Credit to: [NearHuscarl](https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart#:~:text=For%20people%20who%20want%20to%20darken%20or%20lighten%20Color%20instead%20of%20hex%20string)
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  /// Returns a new [Color] lightened by the given [amount].
  ///
  /// Credit to: [NearHuscarl](https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart#:~:text=For%20people%20who%20want%20to%20darken%20or%20lighten%20Color%20instead%20of%20hex%20string)
  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
