part of lbplanner_widgets;

/// The theme data for this app.
ThemeData get appStyle => ThemeData(
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
