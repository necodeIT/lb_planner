part of lbplanner_routes;

/// Credits page of the general settings.
class SettingsGeneralAboutRoute extends StatelessWidget {
  /// Credits page of the general settings.
  const SettingsGeneralAboutRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(
    routeName: 'settings/general/credits',
    parent: SettingsRoute.info,
    builder: (_, __) => SettingsGeneralAboutRoute(),
  );

  /// URL to the readme file.
  static const readmeaUrl = "https://raw.githubusercontent.com/necodeIT/lb_planner/app/README.md";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * UpdateRoute.paddingFactor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NcSpacing.xl(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NcVectorImage(code: kAppIcon, height: UpdateRoute.iconSize),
                  NcTitleText(
                    UpdaterService.currentVersionName,
                    fontSize: RouteTitle.titleSize,
                  ),
                ],
              ),
              NcSpacing.large(),
              NcLogo.horizontal(height: UpdateRoute.iconSize),
            ],
          ),
          NcSpacing.large(),
          Expanded(
            child: LpMarkdown.network(Uri.parse(readmeaUrl)),
          ),
        ],
      ),
    );
  }
}
