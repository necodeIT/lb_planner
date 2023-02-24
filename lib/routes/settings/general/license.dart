part of lbplanner_routes;

/// Credits page of the general settings.
class SettingsGeneralLicenseRoute extends StatelessWidget {
  /// Credits page of the general settings.
  const SettingsGeneralLicenseRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(
    routeName: 'settings/general/license',
    parent: SettingsRoute.info,
    builder: (_, __) => SettingsGeneralLicenseRoute(),
  );

  /// URL to the license file.
  static const licenseUrl = "https://raw.githubusercontent.com/necodeIT/lb_planner/app/LICENSE.md";

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
            child: LpMarkdown.network(Uri.parse(licenseUrl)),
          ),
        ],
      ),
    );
  }
}
