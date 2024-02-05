import 'package:flutter/material.dart' hide Feedback;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/features/feedback/domain/domain.dart';
import 'package:lb_planner/features/feedback/presentation/widgets/feedback.dart';
import 'package:lb_planner/features/themes/domain/models/module_status_theme.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/feedback/presentation/widgets/widgets.dart';

@RoutePage()

/// Admin feedback page displaying details about feedback.
class AdminFeedbackPageRoute extends StatefulWidget {
  /// Admin feedback page displaying details about feedback.
  const AdminFeedbackPageRoute({Key? key, required this.feedbackId})
      : super(key: key);

  /// The id of the feedback to display.
  final int feedbackId;

  @override
  State<AdminFeedbackPageRoute> createState() => _AdminFeedbackPageRouteState();
}

class _AdminFeedbackPageRouteState extends State<AdminFeedbackPageRoute> {
  final commentController = TextEditingController();

  late int updated;
  late int deleted;

  _updateFeedback(WidgetRef ref, Feedback feedback) async {
    final controller = ref.watch(feedbackController);

    if (feedback.unread) {
      controller.markFeedbackAsRead(feedback, comment: commentController.text);
      updated = 1;
    }

    updated = 0;

    _pushNext(context, ref, feedback);
  }

  _pushNext(BuildContext context, WidgetRef ref, feedback) {
    var sorted = AdminFeedbackRoute.sortFeedbacks(ref.read(feedbackProvider));
    var currentIndex = sorted?.indexOf(feedback);

    if (sorted!.length - 1 > currentIndex! && currentIndex >= 0) {
      var nextFeedback = sorted[currentIndex + 1];
      context.router.push(AdminFeedbackPageRoute(
          feedbackId: nextFeedback.id, key: ValueKey(nextFeedback.id)));
    } else {
      AdminFeedbackRoute.info.push(context);
    }
  }

  _deleteFeedback(
      BuildContext context, WidgetRef ref, Feedback feedbackToDelete) async {
    ref.read(feedbackController).deleteFeedback(feedbackToDelete);
    deleted = 1;

    deleted = 0;

    _pushNext(context, ref, ref.read(feedbackProvider));
  }

  @override
  Widget build(BuildContext context) {
    bool _commenmtInit = false;

    return Consumer(
      builder: (context, ref, _) {
        int feedbackId = widget.feedbackId;

        var controller = ref.watch(feedbackController);
        var feedback = controller.getFeedbackById(feedbackId);

        if (ref.read(feedbackProvider).isLoading) {
          return ShimmerEffect(height: AdminFeedbackItem.height);
        }

        if (!_commenmtInit) {
          commentController.text = feedback.comment;
          _commenmtInit = true;
        }

        int user = feedback.author;

        return LpContainer(
          title: feedback.type.title(context),
          leading: Icon(feedback.type.icon, color: feedback.type.color),
          trailing: ConditionalWidget(
            condition: deleted == 0,
            trueWidget: (_) => HoverBuilder(
              builder: (context, hover) => Icon(
                Icons.delete,
                color: hover
                    ? context.theme.colorScheme.error
                    : ModuleStatusTheme.of(context).pendingColor,
              ),
              onTap: () => ShowConfirmDialog(
                context,
                title: t.admin_feedback_page_deleteTitle,
                message: t.admin_feedback_page_deleteText,
                confirmIsBad: true,
                onConfirm: () => _deleteFeedback(context, ref, feedback),
              ),
            ),
            falseWidget: (_) => CircularProgressIndicator(
                color: context.theme.colorScheme.error),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.small(),
              FeedbackStatusTag(read: feedback.read),
              Spacing.small(),
              Text(
                t.admin_feedback_page_author(user),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: AdminFeedbackItem.fontSize,
                ),
                textAlign: TextAlign.left,
              ),
              if (feedback.type == FeedbackType.bug)
                Text(
                  t.admin_feedback_page_logFile(feedback.logfile!),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    fontSize: AdminFeedbackItem.fontSize,
                  ),
                  textAlign: TextAlign.left,
                ),
              Text(
                t.admin_feedback_page_id(feedback.id),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: AdminFeedbackItem.fontSize,
                ),
                textAlign: TextAlign.left,
              ),
              Spacing.large(),
              Expanded(
                child: CustomScrollView(
                  controller: ScrollController(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              feedback.content,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis,
                                fontSize: AdminFeedbackItem.fontSize,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.large(),
              Expanded(
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: commentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: t.admin_feedback_page_comment,
                    )),
              ),
              Spacing.large(),
              Align(
                alignment: Alignment.centerRight,
                child: ConditionalWidget(
                  condition: updated != 0,
                  trueWidget: (_) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        feedback.read
                            ? t.admin_feedback_page_update
                            : t.admin_feedback_page_markRead,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          fontSize: AdminFeedbackItem.fontSize,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacing.small(),
                      CircularProgressIndicator(),
                    ],
                  ),
                  falseWidget: (context) => TextButton.icon(
                    label: Text(feedback.read
                        ? t.admin_feedback_page_update
                        : t.admin_feedback_page_markRead),
                    onPressed: () => _updateFeedback(ref, feedback),
                    icon: Icon(Feather.arrow_right_circle,
                        size: AdminFeedbackItem.fontSize * 1.2,
                        color: context.theme.colorScheme.primary),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
