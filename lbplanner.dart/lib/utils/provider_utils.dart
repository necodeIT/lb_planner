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

  /// Adds the given [value] with the given [id] to the state.
  void addValue(int id, T value) {
    var newState = Map<int, T>.from(state);

    newState[id] = value;

    state = newState;
  }
}
