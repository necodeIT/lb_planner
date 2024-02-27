import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/settings/presentation/widgets/widgets.dart';

/// Themes settings.
class SettingsThemes extends StatelessWidget {
  /// Themes settings.
  const SettingsThemes({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return LpContainer(
      title: context.t.settings_themes,
      height: double.infinity,
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Wrap(
            spacing: Spacing.mediumSpacing,
            runSpacing: Spacing.mediumSpacing,
            children: [
              for (var theme in NcThemes.all.values)
                SettingsThemesThemeItem(theme: theme),
            ],
          ),
        ),
      ),
    );
  }
}
