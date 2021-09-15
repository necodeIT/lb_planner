import 'package:desktop/dialogs/confirm_clear_cache.dart';
import 'package:desktop/dialogs/confirm_delete_profile.dart';
import 'package:desktop/generated/l10n.dart';
import 'package:desktop/main.dart';
import 'package:desktop/version.dart';
import 'package:desktop/widgets/course_selection/course_selection.dart';
import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:desktop/widgets/views/settings/general.dart';
import 'package:desktop/widgets/views/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:lb_planner/ui.dart';

import 'feedback.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  static const name = "Settings";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: NcContainer(
                        label: NcCaptionText(
                          "General",
                          fontSize: Dashboard.titleSize,
                        ),
                        body: ListView(
                          children: [
                            SettingsGeneralItem(
                              text: version,
                              icon: Icons.update,
                              onTap: () {
                                // TODO: Check for updates
                                NcSnackBar.showBottomRightMessage(
                                  context,
                                  prefixIcon: Icon(
                                    Icons.update,
                                    color: NcThemes.current.textColor,
                                  ),
                                  message: "You already are up to date!",
                                );
                              },
                            ),
                            NcSpacing.small(),
                            SettingsGeneralItem(
                              text: "Clear Cache",
                              icon: Icons.arrow_forward_ios,
                              onTap: () {
                                showConfirmClearCache(context);
                              },
                            ),
                            NcSpacing.small(),
                            SettingsGeneralItem(
                              text: "Delete Profile",
                              icon: Feather.trash_2,
                              onTap: () {
                                showDeleteProfileDialog(context);
                                // TODO: Check for updates
                              },
                            ),
                            NcSpacing.small(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NcCaptionText(
                                  S.of(context).settings_language,
                                  fontSize: SettingsGeneralItem.defaultFontSize,
                                ),
                                NcDropdown(
                                  value: S.delegate.supportedLocales.indexOf(S.delegate.supportedLocales.where((e) => e.languageCode == Intl.getCurrentLocale()).first),
                                  items: S.delegate.supportedLocales.map((e) => e.languageCode.toUpperCase()).toList(),
                                  onValueChanged: (index) => App.of(context).setLocale(S.delegate.supportedLocales[index]),
                                )
                              ],
                            ),
                            NcSpacing.small(),
                            SettingsGeneralItem(
                              text: "Credits",
                              icon: Icons.info_outline,
                              // onTap: view.route("settings"),
                              onTap: () {
                                guard(context, () => NcView.of(context).route("Credits"));
                                // Navigator.of(context)
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    NcSpacing.large(),
                    Expanded(
                      flex: 3,
                      child: NcContainer(
                        contentAlignment: CrossAxisAlignment.start,
                        label: NcCaptionText(
                          "Themes",
                          fontSize: Dashboard.titleSize,
                        ),
                        body: NcGridView(
                          spacing: NcSpacing.xlSpacing,
                          children: [
                            // TODO: for (var theme in User.current.themes) ThemeItem(theme: theme),
                            for (var theme in NcThemes.all.keys) ThemeItem(theme: theme),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              NcSpacing.large(),
              Expanded(
                flex: 2,
                child: CourseSelection(),
              )
            ],
          ),
        ),
        NcSpacing.large(),
        Expanded(
          child: NcContainer(
            label: NcCaptionText(
              "Feedback",
              fontSize: Dashboard.titleSize,
            ),
            body: SettingsFeedback(),
          ),
        ),
      ],
    );
  }
}
