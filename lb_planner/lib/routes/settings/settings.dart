part of lbplanner_routes;

/// Settings route.
class SettingsRoute extends LocalizedWidget {
  /// Settings route.
  const SettingsRoute({Key? key}) : super(key: key);

  /// Route name.
  static const routeName = "/settings";

  @override
  Widget create(context, t) {
    var placeholder = Center(child: NcTitleText("Test"));
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
                      child: LpContainer(
                        title: t.settings_general,
                        height: double.infinity,
                        child: placeholder,
                      ),
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
          child: LpContainer(
            title: t.settings_feedback,
            child: placeholder,
          ),
        ),
      ],
    );
  }
}
