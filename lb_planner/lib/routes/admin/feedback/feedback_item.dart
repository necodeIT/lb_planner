part of lbplanner_routes;

/// Feedback item.
class AdminFeedbackItem extends StatelessWidget {
  /// Feedback item.
  const AdminFeedbackItem({Key? key, required this.feedbackId}) : super(key: key);

  /// The id of the feedback to display.
  final int feedbackId;

  /// The height of the item.
  static const double height = 300;

  /// The size of the user profile img.
  static const double imgSize = 55;

  /// The size of the font displaying the username.
  static const double usernameFontSize = 20;

  /// The size of the font.
  static const double fontSize = 18;

  /// The size of the font, displaying the user tag.
  static const double userTagFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var feedback = ref.watch(feedbackProvider)[feedbackId];

      if (feedback == null) return LpShimmer(height: height);

      return LpGestureDetector(
        onTap: () => AdminFeedbackPageRoute.info.push(context, params: {"id": feedbackId}),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(NcSpacing.smallSpacing),
            child: Row(
              children: [
                UserProfileImg(size: imgSize, userId: feedback.userId),
                Expanded(
                  child: NcCaptionText(
                    feedback.userId.toString(),
                    fontSize: fontSize,
                  ),
                ),
                Row(
                  children: [
                    LpIcon(
                      feedback.type.icon,
                      color: feedback.type.color,
                      size: scaleIcon(fontSize),
                    ),
                    NcSpacing.xs(),
                    NcCaptionText(
                      feedback.type.title(context),
                      fontSize: fontSize,
                    ),
                  ],
                ),
                // NcCaptionText(
                //   feedback.,
                //   fontSize: fontSize,
                // ),
              ],
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
