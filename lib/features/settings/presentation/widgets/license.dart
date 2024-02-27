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
                  VectorImage('assets/svg/app_icon.svg', height: 60),
                  NcTitleText(
                    UpdaterService.currentVersionName,
                    fontSize: 25,
                  ),
                ],
              ),
              Spacing.large(),
              NcLogo.horizontal(height: 60),
            ],
          ),
          Spacing.large(),
          Expanded(
            child: MarkdownView.network(Uri.parse(licenseUrl)),
          ),
        ],
      ),
    );
  }
}
