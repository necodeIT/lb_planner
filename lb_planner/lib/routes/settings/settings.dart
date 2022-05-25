// ignore_for_file: no-magic-number
part of lbplanner_routes;

/// Settings route.
class SettingsRoute extends LocalizedWidget {
  /// Settings route.
  const SettingsRoute({Key? key}) : super(key: key);

  /// Route name.
  static const routeName = "/settings";

  @override
  Widget build(context, t) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SettingsGeneral(),
                    ),
                    NcSpacing.medium(),
                    Expanded(child: SettingsThemes())
                  ],
                ),
              ),
              NcSpacing.medium(),
              Expanded(
                flex: 2,
                child: SettingsCourses(),
              ),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          flex: 2,
          child: SettingsFeedback(),
        ),
      ],
    );
  }
}
