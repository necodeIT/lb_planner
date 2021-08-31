import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:desktop/widgets/views/settings/course_selection_item.dart';
import 'package:desktop/widgets/views/settings/feedback.dart';
import 'package:desktop/widgets/views/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: "Settings",
      content: Row(
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
                          body: NcLoadingIndicator(),
                        ),
                      ),
                      NcSpacing.large(),
                      Expanded(
                        flex: 3,
                        child: NcContainer(
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
                  child: NcContainer(
                    label: NcCaptionText(
                      "Courses",
                      fontSize: Dashboard.titleSize,
                    ),
                    body: ListView(
                      children: [
                        NcInputField(
                          placeholder: "Search",
                          prefixIcon: Icon(
                            Icons.search,
                            color: NcThemes.current.textColor,
                          ),
                        ),
                        NcSpacing.small(),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                        CourseSelectionItem(id: 0),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}
