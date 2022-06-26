part of lbplanner_engine;

/// An observable class that stores a single immutable [state].
/// This class extends from [riverpod.StateNotifier] and adds some utilites such as checking if [mounted] when setting the state.
///
/// It can be used as a drop-in replacement to `ChangeNotifier` or other equivalent
/// objects like `Bloc`.
/// Its particularity is that it tries to be simple, yet promote immutable data.
///
/// By using immutable state, it becomes a lot simpler to:
/// - compare previous and new state
/// - implement undo-redo mechanism
/// - debug the application state
/// ## Example: Counter
///
/// [StateNotifier] is designed to be subclassed.
/// We first need to pass an initial value to the `super` constructor, to define
/// the initial state of our object.
///
/// ```dart
/// class Counter extends StateNotifier<int> {
///   Counter(): super(0);
/// }
/// ```
///
/// We can then expose methods on our [StateNotifier] to allow other objects
/// to modify the counter:
///
/// ```dart
/// class Counter extends StateNotifier<int> {
///   Counter(): super(0);
///
///   void increment() => state++;
///   void decrement() => state--;
/// }
/// ```
///
/// assigning [state] to a new value will automatically notify the listeners
/// and update the UI.
///
/// Then, the object can either be listened like with `StateNotifierBuilder`/`StateNotifierProvider`
/// using `package:flutter_state_notifier` or `package:riverpod`.
///
/// See also:
///
/// - [addListener], to manually listen to a [StateNotifier]
/// - [state], to internally read and update the value exposed.
abstract class StateNotifier<T> extends riverpod.StateNotifier<T> {
  /// An observable class that stores a single immutable [state].
  /// This class extends from [riverpod.StateNotifier] and adds some utilites such as checking if [mounted] when setting the state.
  StateNotifier(T value) : super(value) {
    init();
  }

  @override
  set state(T newState) {
    if (!mounted) return;

    super.state = newState;
    onUpdate();
  }

  /// Override this function to do some initial laoding.
  init() => null;

  /// Called when the state is updated.
  onUpdate() => null;

  /// Sets the state from the given [value] and notifies the listeners.
  setState(T value) {
    state = value;
  }

  /// Sets the state from the given [response] if it succeeded and notifies the listeners.
  setStateFromResponse(ApiResponse<T> response) {
    if (response.succeeded) setState(response.value!);
  }

  /// Notifies all listeners.
  void notifyListeners() {
    state = state;
  }
}
