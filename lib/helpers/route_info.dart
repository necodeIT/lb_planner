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
  final Widget Function(BuildContext, Map<String, dynamic>) builder;

  /// Params the route needs.
  final Map<String, Type>? args;

  /// Contains all information needed to build a route.
  const RouteInfo({required this.routeName, required this.builder, this.titleGenerator, this.standalone = false, this.parent, this.args});

  /// Returns the route title.
  ///
  /// Do not use [titleGenerator]
  String title(BuildContext context) {
    var t = context.t;
    return titleGenerator?.call(t) ?? parent?.titleGenerator?.call(t) ?? routeName.replaceAll('/', ' ').toTitleCase();
  }

  /// Builds the route.
  Widget build(BuildContext context, RouteArgs parameters) {
    validateParameters(parameters.args);

    return builder(context, parameters.args);
  }

  @override
  operator ==(Object other) {
    if (other is RouteInfo) {
      return routeName == other.routeName;
    }

    return false;
  }

  @override
  int get hashCode => routeName.hashCode;

  /// Asserts that every required args are present.
  void validateParameters(Map<String, dynamic>? args) {
    if (this.args != null) {
      assert(args != null, "Route $routeName needs args but none were provided.");

      for (var paramDef in this.args!.entries) {
        var _paramValue = args![paramDef.key];
        assert(_paramValue != null, "Missing argument ${paramDef.key}");

        assert(_paramValue.runtimeType == paramDef.value, "Argument ${paramDef.key} is of type ${_paramValue.runtimeType} but should be of type ${paramDef.value}");
      }
    }
  }

  /// Pushes the route.
  void push(BuildContext context, {Map<String, dynamic>? params}) {
    validateParameters(params);

    Navigator.pushReplacementNamed(context, routeName, arguments: RouteArgs(params));
  }
}

/// Wrapper for route parameters for better handling.
class RouteArgs {
  /// The wrapped parameters.
  late final Map<String, dynamic> args;

  /// Wrapper for route parameters for better handling.
  RouteArgs(Map<String, dynamic>? args) : args = args ?? {};

  /// [RouteArgs] from [RouteSettings.arguments].
  RouteArgs.fromRouteSettings(RouteSettings settings) {
    if (settings.arguments is Map<String, dynamic>) {
      args = settings.arguments as Map<String, dynamic>;
    } else if (settings.arguments is RouteArgs) {
      args = (settings.arguments as RouteArgs).args;
    } else {
      args = {};
    }
  }
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
