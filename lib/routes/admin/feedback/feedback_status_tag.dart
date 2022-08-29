part of lbplanner_routes;

/// A tag based on [FeedbackStatus]
class LpFeedbackStatusTag extends LocalizedWidget {
  /// A tag based on [FeedbackStatus]
  const LpFeedbackStatusTag({Key? key, required this.status, this.fontSize, this.label = false}) : super(key: key);

  /// The status of the tag.
  final FeedbackStatus status;

  /// The font size of the tag.
  final double? fontSize;

  /// Whether to display the status as a label.
  final bool label;

  /// THe background opacity of the tag.
  static const opacity = .5;

  @override
  Widget build(BuildContext context, t) {
    var color = status.isRead
        ? successColor
        : label
            ? textColor
            : neutralColor;
    return Container(
      padding: label ? null : const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: label
          ? null
          : BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: BorderRadius.circular(kRadius),
            ),
      child: ConditionalWidget(
        condition: label,
        trueWidget: (context) => NcBodyText(
          status.isRead ? t.admin_feedback_status_read : t.admin_feedback_status_unread,
          color: color,
          fontSize: fontSize,
          textAlign: TextAlign.center,
        ),
        falseWidget: (context) => NcTitleText(
          status.isRead ? t.admin_feedback_status_read : t.admin_feedback_status_unread,
          color: color,
          fontSize: fontSize,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
