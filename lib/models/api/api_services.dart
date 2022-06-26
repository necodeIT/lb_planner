part of lbplanner_engine;

/// Contains any supported api services by the api.
enum ApiServices {
  /// Moodle mobile app api service
  // ignore: constant_identifier_names
  moodle_mobile_app,

  /// LB Planner api service
  lpa
}

/// Bool extension for different [ApiServices].
extension ApiServicesExtension on ApiServices {
  /// Whether the [this] is of type [ApiServices.moodle_mobile_app].
  bool get isMoodleMobileApp => this == ApiServices.moodle_mobile_app;

  /// Whether the [this] is of type [ApiServices.lpa].
  bool get isLpa => this == ApiServices.lpa;
}
