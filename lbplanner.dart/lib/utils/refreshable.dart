part of lbplanner_api;

/// Allows any class to be automatically refreshed based on a timer.
///
/// [kApiRefreshRate] is the timer duration.
abstract class IRefreshable {
  DateTime? _lastRefresh;
  bool _refresh = true;
  bool _refreshStarted = false;

  /// The time at which the last refresh happened.
  DateTime? get lastRefresh => _lastRefresh;

  /// Reports an external refresh that was not in sync with the internal clock.
  void reportRefresh() {
    _lastRefresh = DateTime.now();
  }

  /// Disables the automatic refresh.
  void stopRefresh() {
    _refresh = false;
  }

  /// Enables the automatic refresh.
  ///
  /// If the refresh timer was not running before it will be automatically intiated.
  void startRefresh() {
    _refresh = true;
    if (!_refreshStarted) refresh();
  }

  /// Override this to execute your refresh logic.
  onRefresh();

  /// Whether everything is ready and set up to refresh.
  ///
  /// If this returns false, the current refresh cycle will be skipped.
  bool get canRefresh;

  /// Automatically calls [onRefresh] on a timed basis.
  /// This will be called automatically every [kApiRefreshRate].
  ///
  /// If [canRefresh] returns false, the refresh will be skipped.
  /// If [canRefresh] returns true, the refresh will be executed.
  ///
  /// Internal only!
  @nonVirtual
  @protected
  void refresh() async {
    if (_refreshStarted) return;

    _refreshStarted = true;

    if (_lastRefresh != null) {
      var diff = DateTime.now().difference(_lastRefresh!);

      if (diff < kApiRefreshRate) {
        var delay = kApiRefreshRate - diff;

        await Future.delayed(delay);
      }
    }

    if (canRefresh && _refresh) {
      onRefresh();
    }

    await Future.delayed(kApiRefreshRate);

    refresh();
  }
}
