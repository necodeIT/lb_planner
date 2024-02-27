import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/settings/presentation/widgets/widgets.dart';

/// Item for [SettingsGeneral]
class SettingsGeneralItem extends StatelessWidget {
  /// Item for [SettingsGeneral]
  const SettingsGeneralItem(
      {Key? key,
      required this.title,
      this.icon,
      this.onTap,
      this.customAction,
      this.loading = false})
      : super(key: key);

  /// Title of the item.
  final String title;

  /// Icon of the action button
  final IconData? icon;

  /// Action to perform when the action button is tapped.
  final VoidCallback? onTap;

  /// Use this if you want more control over the action button and to define a custom one.
  ///
  /// If not specified [icon] and [onTap] will be used.
  final Widget? customAction;

  /// Whether the current action is loading.
  ///
  /// This will be ignored if [customAction] is specified.
  final bool loading;

  /// The font size of the [title].
  static const double fontSize = 17;

  /// The size of the [icon].
  static const double iconSize = 20;

  /// The size of the button.
  static const double buttonSize = 30;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Spacing.small(),
        ConditionalWidget(
          condition: customAction != null,
          ifTrue: customAction!,
          ifFalse: GestureDetector(
            onTap: onTap!,
            child: HoverBuilder(
              builder: (context, isHovering) => Container(
                height: buttonSize,
                width: buttonSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.theme.colorScheme.surface,
                ),
                child: ConditionalWidget(
                  condition: loading,
                  ifTrue: CircularProgressIndicator(),
                  ifFalse: Icon(
                    icon!,
                    color: isHovering
                        ? context.theme.colorScheme.primary
                        : context.theme.textTheme.bodyMedium!.color,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
