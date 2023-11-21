import 'dart:async';

import 'package:riverpod/riverpod.dart';

/// A class to use instead of [StateNotifier] which provides a way to automatically refresh the [state].
abstract class AutoRefreshStateNotifier<T> extends StateNotifier<T> {
  /// A class to use instead of [StateNotifier] which provides a way to automatically refresh the [state].
  AutoRefreshStateNotifier(super.state) {
    _kickStart();
  }

  /// The refresh rate of the data.
  Duration get refreshRate => const Duration(seconds: 10);

  /// Returns the new state.
  ///
  /// This function is called in an interval of [refreshRate].
  ///
  /// The value returned by this function will be set as the new state if it is different from the current state.
  ///
  /// Errors thrown by this function will **not** be caught.
  FutureOr<T> onRefresh();

  /// The timer to use to refresh the data.
  Timer? _timer;

  /// Starts the timer to refresh the data.
  void _kickStart() {
    if (_timer != null) throw StateError('The timer is already running.');

    _timer = Timer.periodic(refreshRate, (timer) async {
      var newState = await onRefresh();

      if (newState != state) {
        state = newState;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
