import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Credits page of the general settings.
class SettingsGeneralLicenseRoute extends StatelessWidget {
  /// Credits page of the general settings.
  const SettingsGeneralLicenseRoute({Key? key}) : super(key: key);

  /// URL to the license file.
  static const licenseUrl =
      "https://raw.githubusercontent.com/necodeIT/lb_planner/app/LICENSE.md";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * UpdateRoute.paddingFactor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacing.xl(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  VectorImage(code: kAppIcon, height: UpdateRoute.iconSize),
                  NcTitleText(
                    UpdaterService.currentVersionName,
                    fontSize: RouteTitle.titleSize,
                  ),
                ],
              ),
              Spacing.large(),
              NcLogo.horizontal(height: UpdateRoute.iconSize),
            ],
          ),
          Spacing.large(),
          Expanded(
            child: LpMarkdown.network(Uri.parse(licenseUrl)),
          ),
        ],
      ),
    );
  }
}
