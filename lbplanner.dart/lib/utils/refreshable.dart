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

  /// Internal only - only call this if you know what you are doing!
  ///
  /// Automatically calls [onRefresh] on a timed basis.
  /// This will be called automatically every [kApiRefreshRate].
  ///
  /// If [canRefresh] returns false, the refresh will be skipped.
  /// If [canRefresh] returns true, the refresh will be executed.
  @nonVirtual
  @protected
  void refresh() async {
    log("$runtimeType - Auto refresh");

    _refreshStarted = true;

    if (_lastRefresh != null) {
      var diff = DateTime.now().difference(_lastRefresh!);

      if (diff < kApiRefreshRate) {
        var delay = kApiRefreshRate - diff;
        
        log("$runtimeType - Waiting ${delay.inSeconds} until next cycle");
        
        await Future.delayed(delay);
      }
    }

    if (canRefresh && _refresh) {
      log("$runtimeType - Refreshed");
      onRefresh();
    }else{
      log("$runtimeType - Skipped refresh cycle - canRefresh: $canRefresh, refreshStarted:$_refresh");
    }

    await Future.delayed(kApiRefreshRate);

    refresh();
  }
}
