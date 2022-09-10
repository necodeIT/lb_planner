part of lbplanner_engine;

/// Allows any class to be automatically refreshed based on a timer.
///
/// [kApiRefreshRate] is the default timer duration.
abstract class IRefreshable {
  // static bool _pauseAll = false;

  // /// Pausese all refreshable objects.
  // static void pauseAll() {
  //   _pauseAll = true;
  // }

  // /// Resumes all refreshable objects.
  // static void resumeAll() {
  //   _pauseAll = false;
  // }

  DateTime? _lastRefresh;
  bool _autoRefresh = false;

  /// The time at which the last refresh happened.
  DateTime? get lastRefresh => _lastRefresh;

  /// Reports an external refresh that was not in sync with the internal clock.
  void reportRefresh() {
    _lastRefresh = DateTime.now();
  }

  /// Disables the automatic refresh.
  void pauseAutoRefresh() {
    if (!_autoRefresh) return;

    _autoRefresh = false;

    _log("$runtimeType - Auto refresh paused");
  }

  /// Enables the automatic refresh.
  ///
  /// If the refresh timer was not running before it will be automatically intiated.
  void startAutoRefresh() {
    if (_autoRefresh) return;

    _autoRefresh = true;

    _log("$runtimeType - Started auto refresh");

    refresh();
  }

  /// Override this to execute your refresh _logic.
  onRefresh();

  /// Whether everything is ready and set up to refresh.
  ///
  /// If this returns false, the current refresh cycle will be skipped.
  bool get canRefresh;

  /// Whether activity should be _logged or not.
  bool get silent => false;

  /// The refresh rate of the refreshable.
  ///
  /// Override to set a custom refresh rate. Defaults to [kApiRefreshRate]
  Duration get refreshRate => kApiRefreshRate;

  /// Whether auto refresh is enabled or not.
  bool get autoRefresh => _autoRefresh;

  /// Internal only - only call this if you know what you are doing!
  ///
  /// Automatically calls [onRefresh] on a timed basis.
  /// This will be called periodically in the set [refreshRate].
  ///
  /// If [canRefresh] returns false, the refresh will be skipped.
  /// If [canRefresh] returns true, the refresh will be executed.
  @nonVirtual
  @protected
  void refresh() async {
    if (!_autoRefresh) return;

    // if (_pauseAll) {
    //   await Future.delayed(refreshRate);

    //   refresh();
    // }

    if (_lastRefresh != null) {
      var diff = DateTime.now().difference(_lastRefresh!);

      if (diff < refreshRate) {
        var delay = refreshRate - diff;

        if (delay.inSeconds > 0) {
          _log("$runtimeType - Shifted clock by ${delay.inSeconds}s due to external refresh");

          await Future.delayed(delay);
        }
      }
    }

    if (canRefresh) {
      _log("$runtimeType - Refreshed");
      onRefresh();
    } else {
      _log("$runtimeType - Skipped refresh cycle");
    }

    await Future.delayed(refreshRate);

    refresh();
  }

  void _log(Object msg) {
    if (silent) return;

    log(msg, LogTypes.debug, 1);
  }
}
