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
  final Map<String, Type>? params;

  /// Contains all information needed to build a route.
  const RouteInfo({required this.routeName, required this.builder, this.titleGenerator, this.standalone = false, this.parent, this.params});

  /// Returns the route title.
  ///
  /// Do not use [titleGenerator]
  String title(BuildContext context) {
    var t = context.t;
    return titleGenerator?.call(t) ?? parent?.titleGenerator?.call(t) ?? routeName.replaceAll('/', ' ').toTitleCase();
  }

  /// Builds the route.
  Widget build(BuildContext context, RouteParameters parameters) {
    validateParameters(parameters.params);

    return builder(context, parameters.params);
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

  /// Asserts that any required params are present.
  void validateParameters(Map<String, dynamic>? params) {
    if (this.params != null) {
      assert(params != null, "Route $routeName needs params but none were provided.");

      for (var paramDef in this.params!.entries) {
        var _paramValue = params![paramDef.key];
        assert(_paramValue != null, "Missing parameter ${paramDef.key}");

        assert(_paramValue.runtimeType == paramDef.value, "Parameter ${paramDef.key} is of type ${_paramValue.runtimeType} but should be of type ${paramDef.value}");
      }
    }
  }

  /// Pushes the route.
  void push(BuildContext context, {Map<String, dynamic>? params}) {
    validateParameters(params);

    Navigator.pushReplacementNamed(context, routeName, arguments: RouteParameters(params));
  }
}

/// Wrapper for route parameters for better handling.
class RouteParameters {
  /// The wrapped parameters.
  late final Map<String, dynamic> params;

  /// Wrapper for route parameters for better handling.
  RouteParameters(Map<String, dynamic>? params) : params = params ?? {};

  /// [RouteParameters] from [RouteSettings.arguments].
  RouteParameters.fromRouteSettings(RouteSettings settings) {
    if (settings.arguments is Map<String, dynamic>) {
      params = settings.arguments as Map<String, dynamic>;
    } else if (settings.arguments is RouteParameters) {
      params = (settings.arguments as RouteParameters).params;
    } else {
      params = {};
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
