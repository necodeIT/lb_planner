part of lbplanner_api;

/// Allows any class to be automatically refreshed based on a timer.
///
/// [kApiRefreshRate] is the timer duration.
abstract class IRefreshable {
  DateTime? _lastRefresh;
  bool _autoRefresh = false;

  /// The time at which the last refresh happened.
  DateTime? get lastRefresh => _lastRefresh;

  /// Reports an external refresh that was not in sync with the internal clock.
  void reportRefresh() {
    _lastRefresh = DateTime.now();
  }

  /// Disables the automatic refresh.
  void stopAutoRefresh() {
    if(!_autoRefresh) return;
    
    _autoRefresh = false;
    
    log("$runtimeType - Stopped auto refresh");
  }

  /// Enables the automatic refresh.
  ///
  /// If the refresh timer was not running before it will be automatically intiated.
  void startAutoRefresh() {
     if(_autoRefresh) return;
    
    _autoRefresh = true;
    
    log("$runtimeType - Started auto refresh");
    
    refresh();
  }

  /// Override this to execute your refresh logic.
  onRefresh();

  /// Whether everything is ready and set up to refresh.
  ///
  /// If this returns false, the current refresh cycle will be skipped.
  bool get canRefresh;
   
  /// Whether auto refresh is enabled or not.
  bool get autoRefresh => _autoRefresh ;

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
    if(!_autoRefresh) return;

    if (_lastRefresh != null) {
      var diff = DateTime.now().difference(_lastRefresh!);

      if (diff < kApiRefreshRate) {
        var delay = kApiRefreshRate - diff;
        
        log("$runtimeType - Waiting ${delay.inSeconds} until next cycle");
        
        await Future.delayed(delay);
      }
    }

    if (canRefresh) {
      log("$runtimeType - Refreshed");
      onRefresh();
    }else{
      log("$runtimeType - Skipped refresh cycle");
    }

    await Future.delayed(kApiRefreshRate);

    refresh();
  }
}
