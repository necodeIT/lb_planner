// ignore_for_file: invalid_use_of_protected_member

part of lbplanner_api;

/// Provides helper methods for [StateNotifier]
extension ProviderMapUtils<T> on StateNotifier<Map<int, T>> {
  /// Updates the [value] of the given [id] and and replaces the state with the new map.
  void updateValue(int id, T value) {
    var newState = Map<int, T>.from(state);

    newState[id] = value;

    state = newState;
  }

  /// Removes removes the entry with the given [id] from the state.
  void removeValue(int id) {
    var newState = Map<int, T>.from(state);

    newState.remove(id);

    state = newState;
  }

  /// Asserts that the state contains the entry with the given [id].
  void assertId(int id) {
    assert(state.containsKey(id), '${T.runtimeType} with id $id does not exist');
  }
}

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
  StateNotifier(T value) : super(value);

  @override
  set state(T newState) {
    if (!mounted) return;

    super.state = newState;
  }
}