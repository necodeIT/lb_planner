import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/feedback/domain/domain.dart';
import 'package:lb_planner/features/feedback/presentation/presentation.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Feedback item.
class AdminFeedbackItem extends ConsumerStatefulWidget {
  /// Feedback item.
  const AdminFeedbackItem({Key? key, required this.feedbackId})
      : super(key: key);

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
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminFeedbackItemState();
}

class _AdminFeedbackItemState extends ConsumerState<AdminFeedbackItem> {
  @override
  Widget build(BuildContext context) {
    int feedbackId = widget.feedbackId;
    var controller = ref.watch(feedbackController);
    var feedback = controller.getFeedbackById(feedbackId);

    if (ref.read(feedbackProvider).isLoading) {
      return ShimmerEffect(height: AdminFeedbackItem.height);
    }

    int author = feedback.author;

    int? modifyingUser = feedback.modifiedByUserId;

    return GestureDetector(
      onTap: () => context.router.navigate(const LoginRoute())
          AdminFeedbackPageRoute.info.push(context, params: {"id": feedbackId}),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  UserProfileImg(
                      size: AdminFeedbackItem.imgSize, userId: author),
                  Spacing.small(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ref.read(usersProvider)[author].fullname,
                        style: TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: AdminFeedbackItem.usernameFontSize,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        t.global_user_vintage(
                            ref.read(usersProvider)[author].vintage),
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: AdminFeedbackItem.userTagFontSize,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: FeedbackStatusTag(
                read: feedback.read,
                fontSize: AdminFeedbackItem.fontSize,
                label: true,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    feedback.type.icon,
                    color: feedback.type.color(context),
                    size: AdminFeedbackItem.fontSize * 1.2,
                  ),
                  Spacing.xs(),
                  Text(
                    feedback.type.title(context),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: AdminFeedbackItem.fontSize,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                feedback.modifiedAt != null
                    ? timeago.format(feedback.modifiedAt!)
                    : t.admin_feedback_null,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: AdminFeedbackItem.fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                modifyingUser != null
                    ? ref.read(usersProvider)[modifyingUser].fullname
                    : t.admin_feedback_null,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: AdminFeedbackItem.fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                timeago.format(feedback.createdAt),
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: AdminFeedbackItem.fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension _AdminFeedbackItemHelper on FeedbackType {
  String title(BuildContext context) {
    var t = context.t;

    switch (this) {
      case FeedbackType.bug:
        return t.admin_feedback_types_bug;
      case FeedbackType.suggestion:
        return t.admin_feedback_types_suggestion;
      case FeedbackType.typo:
        return t.admin_feedback_types_error;
      case FeedbackType.other:
        return t.admin_feedback_types_other;
    }
  }

  IconData get icon {
    switch (this) {
      case FeedbackType.bug:
        return Icons.bug_report;
      case FeedbackType.suggestion:
        return Icons.lightbulb_outline;
      case FeedbackType.typo:
        return Icons.error;
      case FeedbackType.other:
        return Icons.help;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case FeedbackType.bug:
        return context.theme.colorScheme.error;
      case FeedbackType.other:
      case FeedbackType.suggestion:
        return context.theme.colorScheme.primary;
      case FeedbackType.typo:
        return ModuleStatusTheme.of(context).uploadedColor;
    }
  }
}
