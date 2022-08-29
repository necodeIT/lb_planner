part of lbplanner_routes;

/// Feedback item.
class AdminFeedbackItem extends LocalizedWidget {
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
  Widget build(BuildContext context, t) {
    return Consumer(builder: (context, ref, _) {
      var feedback = ref.watch(feedbackProvider)[feedbackId];

      if (feedback == null) return LpShimmer(height: height);

      var user = ref.watch(usersProvider)[feedback.userId];

      if (user == null) return LpShimmer(height: height);

      var modifyingUser = ref.watch(usersProvider)[feedback.lastModifiedBy];

      return LpGestureDetector(
        onTap: () => AdminFeedbackPageRoute.info.push(context, params: {"id": feedbackId}),
        child: LpCard(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    UserProfileImg(size: imgSize, userId: feedback.userId),
                    NcSpacing.small(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NcBodyText(
                          user.fullname,
                          fontSize: usernameFontSize,
                        ),
                        NcBodyText(
                          t.admin_feedback_userTag(user.username),
                          fontSize: userTagFontSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NcBodyText(
                  feedback.status.isRead ? t.admin_feedback_status_read : t.admin_feedback_status_unread,
                  fontSize: fontSize,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LpIcon(
                      feedback.type.icon,
                      color: feedback.type.color,
                      size: scaleIcon(fontSize),
                    ),
                    NcSpacing.xs(),
                    NcBodyText(
                      feedback.type.title(context),
                      fontSize: fontSize,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NcBodyText(
                  feedback.lastModified != null ? timeago.format(feedback.lastModified!) : t.admin_feedback_null,
                  fontSize: fontSize,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: NcBodyText(
                  modifyingUser != null ? modifyingUser.fullname : t.admin_feedback_null,
                  fontSize: fontSize,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: NcBodyText(
                  timeago.format(feedback.timestamp),
                  fontSize: fontSize,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
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
