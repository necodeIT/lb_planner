part of lbplanner_widgets;

/// Provides localized strings for the app.
abstract class LocalizedWidget extends StatelessWidget {
  /// Provides localized strings for the app.
  const LocalizedWidget({Key? key}) : super(key: key);

  @override
  @nonVirtual
  Widget build(BuildContext context) => create(context, context.t);

  /// Creates the widget.
  /// Similar to [StatelessWidget.build] but with [AppLocalizations] as extra parameter.
  Widget create(BuildContext context, AppLocalizations t);
}

/// Provides localized strings for the app.
extension ContextLocalization on BuildContext {
  /// Provides localized strings for the app.
  AppLocalizations get t => AppLocalizations.of(this)!;
}

/// Provides localized strings for the app.
extension StateLocalization<T extends StatefulWidget> on State<T> {
  /// Provides localized strings for the app.
  AppLocalizations get t => context.t;
}
