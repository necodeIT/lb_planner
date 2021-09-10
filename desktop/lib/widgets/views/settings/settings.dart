import 'package:desktop/widgets/views/settings/credits.dart';
import 'package:desktop/widgets/views/settings/settings_route.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return NcView(
      routes: [
        NcView.route(
          title: SettingsRoute.name,
          content: SettingsRoute(),
        ),
        NcView.route(
          title: Credits.name,
          popRoute: SettingsRoute.name,
          content: Credits(),
        )
      ],
    );
  }
}
