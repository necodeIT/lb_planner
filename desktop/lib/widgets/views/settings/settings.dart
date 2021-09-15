import 'package:desktop/generated/l10n.dart';
import 'package:desktop/widgets/views/settings/credits.dart';
import 'package:desktop/widgets/views/settings/settings_route.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  static const settingsRoute = "settings";
  static const creditsRoute = "creidts";

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return NcView(
      routes: [
        NcView.route(
          title: S.of(context).settings_title,
          customRouteName: SettingView.settingsRoute,
          content: SettingsRoute(),
        ),
        NcView.route(
          title: S.of(context).settings_title,
          customRouteName: SettingView.creditsRoute,
          popRoute: SettingView.settingsRoute,
          content: Credits(),
        )
      ],
    );
  }
}
