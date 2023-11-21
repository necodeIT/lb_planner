
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

/// Extension properties for [BuildContext].
extension ContextProperties on BuildContext {
  /// Current translations for this [BuildContext].
  AppLocalizations get t => AppLocalizations.of(this)!;

  /// Current locale of this [BuildContext].
  Locale get locale => Localizations.localeOf(this);

  /// Current theme for this [BuildContext].
  ThemeData get theme => Theme.of(this);
}

/// Extension properties for [State].
extension StatefulWidgetProperties on State {
  /// Current translations for this [State].
  AppLocalizations get t => context.t;

  /// Current locale of this [State].
  Locale get locale => context.locale;

  /// Current theme for this [State].
  ThemeData get theme => context.theme;

  /// Calls [setState] if the widget is mounted.
  ///
  /// [fn] is only called if the widget is [mounted].
  void setStateIfMounted(VoidCallback fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn);
    }
  }

  /// Rebuilds the widget.
  ///
  /// Only rebuilds if the widget is [mounted].
  void rebuild() {
    // ignore: invalid_use_of_protected_member
    if (mounted) setState(() {});
  }

  /// Rebuilds the widget if [condition] is `true`.
  ///
  /// Only rebuilds if the widget is [mounted].
  void rebuildIf(bool condition) {
    if (condition) {
      rebuild();
    }
  }
}
