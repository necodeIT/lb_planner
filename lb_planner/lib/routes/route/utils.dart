part of lbplanner_routes;

/// The current route that was pushed.
String get currentRoute => RouteWrapper.currentRoute;

/// Whether the current route is [LoginRoute.routeName].
bool get isLogin => RouteWrapper.currentRouteStandalone;

/// Utils for handling routes.
extension RouteExtensions on String {
  /// Returns the human readable name of the route.
  String toHumanReadableRouteName(BuildContext context) => kRouteToTitle[this]?.call(context) ?? replaceAll('/', ' ').toTitleCase();

  /// Capitalizes the first letter of each word.
  String toTitleCase() {
    if (length <= 1) {
      return toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ').trim();
  }
}
