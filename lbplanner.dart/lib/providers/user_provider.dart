part of lbplanner_api;

/// Provides the current user
class UserProvider extends StateNotifier<User> {
  /// Provides the current user
  UserProvider() : super(User.empty());
}
