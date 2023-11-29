import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Settings route.
class SettingsScreen extends StatefulWidget {
  /// Settings route.
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SettingsGeneral(),
                    ),
                    Spacing.medium(),
                    Expanded(child: SettingsThemes())
                  ],
                ),
              ),
              Spacing.medium(),
              Expanded(
                flex: 2,
                child: SettingsCourses(),
              ),
            ],
          ),
        ),
        Spacing.medium(),
        Expanded(
          flex: 2,
          child: SettingsFeedback(),
        ),
      ],
    );
  }
}
