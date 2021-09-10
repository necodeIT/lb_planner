import 'package:desktop/dialogs/confirm_clear_cache.dart';
import 'package:desktop/dialogs/confirm_delete_profile.dart';
import 'package:desktop/version.dart';
import 'package:desktop/widgets/course_selection/course_selection.dart';
import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:desktop/widgets/views/settings/credits.dart';
import 'package:desktop/widgets/views/settings/feedback.dart';
import 'package:desktop/widgets/views/settings/general.dart';
import 'package:desktop/widgets/views/settings/settings_route.dart';
import 'package:desktop/widgets/views/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
          title: "Settings",
          content: SettingsRoute(),
        ),
        NcView.route(
          title: "Credits",
          onNavigateBack: NcView.of(context).route("Settings"),
          content: Credits(onOceanThemeUnlocked: () {}),
        )
      ],
    );
  }
}
