part of lbplanner_widgets;

/// Provides localized strings for the app.
abstract class LocalizedWidget extends StatefulWidget {
  /// Provides localized strings for the app.
  const LocalizedWidget({Key? key}) : super(key: key);

  /// Creates the widget.
  Widget build(BuildContext context, AppLocalizations t);

  @override
  State<LocalizedWidget> createState() => _LocalizedWidgetState();
}

class _LocalizedWidgetState extends State<LocalizedWidget> {
  @override
  Widget build(BuildContext context) => widget.build(context, t);
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
