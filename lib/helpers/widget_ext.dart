part of lbplanner_helpers;

/// Extensions for [State]
extension StflWidgetExt on State {
  /// Force a rebuild of the widget.
  void rebuild() {
    // ignore: invalid_use_of_protected_member
    if (mounted) setState(() {});
  }
}
