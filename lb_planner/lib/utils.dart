import 'package:flutter/material.dart';
import 'package:lb_planner/widgets.dart';
import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_ui/core.dart';

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

ThemeData get themeData => ThemeData(
      splashFactory: NoSplash.splashFactory,

      // TODO: theme ToolbarOtpions

      scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered) || states.contains(MaterialState.dragged)) return 8;

            return 6.0;
          },
        ),
        thumbColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) return accentColor.withOpacity(0.5);

            if (states.contains(MaterialState.dragged)) return accentColor;

            return tertiaryColor.withOpacity(0.5);
          },
        ),
      ),

      cardTheme: CardTheme(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
      ),
      hoverColor: accentColor.withOpacity(.7),
      splashColor: accentColor,
      cardColor: primaryColor,
      primaryColor: errorColor,
      brightness: brightness,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: accentColor.withOpacity(.7),
        selectionHandleColor: accentColor,
      ),
    );
