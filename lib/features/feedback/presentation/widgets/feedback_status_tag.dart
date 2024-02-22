import 'package:flutter/material.dart';
import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/shared/shared.dart';

/// A tag based on [read]
class FeedbackStatusTag extends StatefulWidget {
  /// A tag based on [read]
  const FeedbackStatusTag(
      {Key? key, required this.read, this.fontSize, this.label = false})
      : super(key: key);

  /// The status of the tag.
  final bool read;

  /// The font size of the tag.
  final double? fontSize;

  /// Whether to display the status as a label.
  final bool label;

  /// THe background opacity of the tag.
  static const opacity = .5;

  @override
  State<FeedbackStatusTag> createState() => _FeedbackStatusTagState();
}

class _FeedbackStatusTagState extends State<FeedbackStatusTag> {
  @override
  Widget build(BuildContext context) {
    var color = widget.read
        ? ModuleStatusTheme.of(context).doneColor
        : widget.label
            ? context.theme.textTheme.bodyLarge!.color!
            : ModuleStatusTheme.of(context).pendingColor;
    return Container(
      padding: widget.label
          ? null
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: widget.label
          ? null
          : BoxDecoration(
              color: color.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
      child: ConditionalWidget(
        condition: widget.label,
        ifTrue: Text(
          widget.read
              ? t.admin_feedback_status_read
              : t.admin_feedback_status_unread,
          style: TextStyle(
            color: color,
            fontSize: widget.fontSize,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
        ),
        ifFalse: Text(
          widget.read
              ? t.admin_feedback_status_read
              : t.admin_feedback_status_unread,
          style: TextStyle(
              color: color,
              fontSize: widget.fontSize,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
