import 'dart:async';

import 'package:riverpod/riverpod.dart';

/// A class to use instead of [StateNotifier] to automatically refresh the data.
abstract class AutoRefreshStateNotifier<T> extends StateNotifier<T> {
  /// Initialze the state and start the timer.
  AutoRefreshStateNotifier(super.state) {
    _kickStart();
  }

  /// The refresh rate of the data.
  Duration get refreshRate => const Duration(seconds: 10);

  /// Refreshes the data and returns the new state.
  ///
  /// If the new state is the same as the old state, the state will not be updated.
  ///
  /// **NOTE**: Errors will not be caught.
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
