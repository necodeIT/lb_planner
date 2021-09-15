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
<<<<<<< Updated upstream
=======
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lb_planner/ui/widgets/grid_view/gridTest.dart';
>>>>>>> Stashed changes

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
                                  message: S.of(context).settings_upToDate,
                                );
                              },
                            ),
                            NcSpacing.small(),
                            SettingsGeneralItem(
                              text: S.of(context).settings_clearCache,
                              icon: Icons.arrow_forward_ios,
                              onTap: () {
                                showConfirmClearCache(context);
                              },
                            ),
                            NcSpacing.small(),
                            SettingsGeneralItem(
                              text: S.of(context).settings_deleteProfile,
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
<<<<<<< Updated upstream
                                  value: S.delegate.supportedLocales.indexOf(S.delegate.supportedLocales.where((e) => e.languageCode == Intl.getCurrentLocale()).first),
                                  items: S.delegate.supportedLocales.map((e) => e.languageCode.toUpperCase()).toList(),
                                  onValueChanged: (index) => App.of(context).setLocale(S.delegate.supportedLocales[index]),
=======
                                  height: 30,
                                  value: AppLocalizations.supportedLocales
                                      .indexOf(AppLocalizations.supportedLocales.where((e) => e.languageCode == Intl.getCurrentLocale()).first),
                                  items: AppLocalizations.supportedLocales.map((e) => e.languageCode.toUpperCase()).toList(),
                                  onValueChanged: (index) => App.of(context).setLocale(AppLocalizations.supportedLocales[index]),
>>>>>>> Stashed changes
                                )
                              ],
                            ),
                            NcSpacing.small(),
                            SettingsGeneralItem(
                              text: S.of(context).settings_credits,
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
                          S.of(context).settings_themes,
                          fontSize: Dashboard.titleSize,
                        ),
                        body: NcGridView(
                          spacing: NcSpacing.xlSpacing,
                          children: [
                            // TODO: for (var theme in User.current.themes) ThemeItem(theme: theme),
                            for (var theme in NcThemes.all.keys) ThemeItem(theme: theme),
                          ],
                        ),
                        //body: Nc2GridView(),
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
