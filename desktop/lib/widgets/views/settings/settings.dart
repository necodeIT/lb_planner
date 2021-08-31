import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

import '../../view.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: "Settings",
      content: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    NcContainer(
                      label: NcTitleText(
                        "General",
                        fontSize: Dashboard.titleSize,
                      ),
                      body: Column(),
                    ),
                  ],
                ),
                NcSpacing.large(),
                NcContainer(
                  label: NcInputField(
                    placeholder: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: NcThemes.current.textColor,
                    ),
                  ),
                  body: Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
