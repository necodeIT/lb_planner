import 'dart:async';

import 'package:riverpod/riverpod.dart';

/// A class to use instead of [AsyncNotifier] which provides a way to automatically refresh the [state].
abstract class AutoRefreshAsyncNotifier<T> extends AsyncNotifier<T> {
  /// If this is `true` the state will be set to [AsyncValue.loading] when the data is refreshed.
  final bool setStateToLoadingOnRefresh;

  /// A class to use instead of [AsyncNotifier] which provides a way to automatically refresh the [state].
  AutoRefreshAsyncNotifier(this.setStateToLoadingOnRefresh) {
    _kickStart();
  }

  /// The refresh rate of the data.
  Duration get refreshRate => const Duration(seconds: 10);

  /// Pauses auto refreshing.
  ///
  /// While paused, [onRefresh] will not be called.
  void pause() {
    _paused = true;
  }

  bool _paused = false;

  /// Resumes auto refreshing.
  void resume() {
    _paused = false;
  }

  /// `true` if auto refreshing is paused.
  bool get isPaused => _paused;

  /// Returns the new state.
  ///
  /// This function is called in an interval of [refreshRate].
  ///
  /// The value returned by this function will be set as the new state if it is different from the current state.
  ///
  /// Execution of this function is guarded by [AsyncValue.guard].
  FutureOr<T> onRefresh();

  /// The timer to use to refresh the data.
  Timer? _timer;

  /// Starts the timer to refresh the data.
  void _kickStart() {
    if (_timer != null) throw StateError('The timer is already running.');

    _timer = Timer.periodic(refreshRate, (timer) async {
      if (isPaused) return;

      if (setStateToLoadingOnRefresh) {
        state = const AsyncValue.loading();
      }

      var newState = await AsyncValue.guard(() async => await onRefresh());

      if (newState != state) {
        state = newState;
      }
    });
  }
}
