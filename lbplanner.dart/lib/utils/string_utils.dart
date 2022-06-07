/// String extensions used by this library.
extension LBPlannerApiStringExt on String {
  /// Calls [Uri.decodeComponent] on [this].
  String get decoded => Uri.decodeComponent(this);
}
