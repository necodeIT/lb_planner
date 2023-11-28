import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/feedback/domain/domain.dart';
import 'package:lb_planner/features/themes/domain/models/module_status_theme.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/feedback/presentation/widgets/widgets.dart';

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

  bool _commenmtInit = false;

  _updateFeedback(WidgetRef ref, Feedback feedback) async {
    final controller = ref.watch(feedbackController);
    var feedbacks = ref.read(feedbackProvider);

    if (feedback.unread) {
      setState(() {
        _updateFuture =
            controller.updateFeedbackStatus(feedback.id, FeedbackStatus.read);
      });

      var response = await _updateFuture;

      if (response!.failed) {
        if (mounted) {
          setState(() {
            _updateFuture = null;
          });
        }

        return;
      }
    }

    setState(() {
      _updateFuture =
          controller.updateFeedbackComment(feedback.id, commentController.text);
    });

    var response = await _updateFuture;

    if (mounted) {
      setState(() {
        _updateFuture = null;
      });

      if (response!.succeeded) _pushNext(feedbacks, feedback);
    }
  }

  _pushNext(Map<int, Feedback> feedbacks, Feedback feedback) {
    var sorted = AdminFeedbackRoute.sortFeedbacks(feedbacks.values.toList());
    var currentIndex = sorted.indexOf(feedback);

    if (sorted.length - 1 > currentIndex && currentIndex >= 0) {
      var nextFeedback = sorted[currentIndex + 1];
      AdminFeedbackPageRoute.info
          .push(context, params: {"id": nextFeedback.id});
    } else {
      AdminFeedbackRoute.info.push(context);
    }
  }

  _deleteFeedback(WidgetRef ref, Feedback feedback) async {
    if (_deleteFuture != null) return;

    setState(() {
      _deleteFuture = ref.read(feedbackController).deleteFeedback(feedback.id);
    });

    var response = await _deleteFuture;

    if (mounted) {
      setState(() {
        _deleteFuture = null;
      });

      if (response!.succeeded) _pushNext(ref.read(feedbackProvider), feedback);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            condition: _deleteFuture == null,
            trueWidget: (_) => HoverBuilder(
              builder: (context, hover) => Icon(
                Icons.delete,
                color: hover
                    ? context.theme.colorScheme.error
                    : ModuleStatusTheme.of(context).pendingColor,
              ),
              onTap: () => lpShowConfirmDialog(
                context,
                title: t.admin_feedback_page_deleteTitle,
                message: t.admin_feedback_page_deleteText,
                confirmIsBad: true,
                onConfirm: () => _deleteFeedback(ref, feedback),
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
                t.admin_feedback_page_author(user.fullname),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: AdminFeedbackItem.fontSize,
                ),
                textAlign: TextAlign.left,
              ),
              if (feedback.type.isBug)
                Text(
                  t.admin_feedback_page_logFile(feedback.logFile),
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
                child: LpTextField.filled(
                  multiline: true,
                  controller: commentController,
                  placeholder: t.admin_feedback_page_comment,
                ),
              ),
              Spacing.large(),
              Align(
                alignment: Alignment.centerRight,
                child: ConditionalWidget(
                  condition: _updateFuture != null,
                  trueWidget: (_) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        feedback.status.isRead
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
                  falseWidget: (context) => LpTextButton(
                    text: feedback.status.isRead
                        ? t.admin_feedback_page_update
                        : t.admin_feedback_page_markRead,
                    fontSize: AdminFeedbackItem.fontSize,
                    trailingIcon: Feather.arrow_right_circle,
                    onPressed: () => _updateFeedback(ref, feedback),
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
