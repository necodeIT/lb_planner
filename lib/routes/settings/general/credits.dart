part of lbplanner_routes;

/// Credits page of the general settings.
class SettingsGeneralCreditsRoute extends StatelessWidget {
  /// Credits page of the general settings.
  const SettingsGeneralCreditsRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(
    routeName: 'settings/general/credits',
    parent: SettingsRoute.info,
    builder: (_, __) => SettingsGeneralCreditsRoute(),
  );

  @override
  Widget build(BuildContext context) {
    return TBA();
  }
}
