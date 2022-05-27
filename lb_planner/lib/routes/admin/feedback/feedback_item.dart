part of lbplanner_routes;

/// Feedback item.
class AdminFeedbackItem extends StatelessWidget {
  /// Feedback item.
  const AdminFeedbackItem({Key? key, required this.feedbackId}) : super(key: key);

  /// The id of the feedback to display.
  final int feedbackId;

  /// The height of the item.
  static const double height = 300;

  /// The width of the item.
  static const double width = 400;

  /// Scale when hovered.
  static const double hoverScale = 1.01;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var feedback = ref.watch(feedbackProvider)[feedbackId];

      if (feedback == null) return LpShimmer(height: height, width: width);

      return ScaleOnHover(
        duration: kFastAnimationDuration,
        scale: hoverScale,
        onTap: () => AdminFeedbackPageRoute.info.push(context, params: {"id": feedbackId}),
        child: LpContainer(
          title: feedback.type.title(context),
          leading: LpIcon(
            feedback.type.icon,
            color: feedback.type.color,
            size: LpContainer.titleFontSize,
          ),
          height: height,
          width: width,
          child: ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: NcBodyText(
                feedback.content,
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      );
    });
  }
}

extension _AdminFeedbackItemHelper on FeedbackTypes {
  String title(BuildContext context) {
    var t = context.t;

    switch (this) {
      case FeedbackTypes.bug:
        return t.admin_feedback_types_bug;
      case FeedbackTypes.suggestion:
        return t.admin_feedback_types_suggestion;
      case FeedbackTypes.error:
        return t.admin_feedback_types_error;
      case FeedbackTypes.other:
        return t.admin_feedback_types_other;
    }
  }

  IconData get icon {
    switch (this) {
      case FeedbackTypes.bug:
        return Icons.bug_report;
      case FeedbackTypes.suggestion:
        return Icons.lightbulb_outline;
      case FeedbackTypes.error:
        return Icons.error;
      case FeedbackTypes.other:
        return Icons.help;
    }
  }

  Color get color {
    switch (this) {
      case FeedbackTypes.bug:
        return errorColor;
      case FeedbackTypes.other:
      case FeedbackTypes.suggestion:
        return accentColor;
      case FeedbackTypes.error:
        return warningColor;
    }
  }
}
