part of lbplanner_helpers;

/// Contains all information needed to build a route.
class RouteInfo {
  /// The route name
  final String routeName;

  /// The route title
  final String Function(AppLocalizations t)? titleGenerator;

  /// Whether the route is standalone and therefore the side bar and user profile should not be generated.
  final bool standalone;

  /// The parent route.
  final RouteInfo? parent;

  /// The builder of the route.
  final WidgetBuilder builder;

  /// Contains all information needed to build a route.
  const RouteInfo({required this.routeName, required this.builder, this.titleGenerator, this.standalone = false, this.parent});

  /// Returns the route title.
  ///
  /// Do not use [titleGenerator]
  String title(BuildContext context) {
    var t = context.t;
    return titleGenerator?.call(t) ?? parent?.titleGenerator?.call(t) ?? routeName.replaceAll('/', ' ').toTitleCase();
  }

  /// Builds the route.
  Widget build(BuildContext context) => builder(context);

  @override
  operator ==(Object other) {
    if (other is RouteInfo) {
      return routeName == other.routeName;
    }

    return false;
  }

  @override
  int get hashCode => routeName.hashCode;

  /// Pushes the route.
  void push(BuildContext context) => Navigator.pushReplacementNamed(context, routeName);
}

/// Utils for handling routes.
extension RouteExtensions on String {
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
