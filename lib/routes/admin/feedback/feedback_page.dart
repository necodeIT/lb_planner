part of lbplanner_routes;

/// Admin feedback page displaying details about feedback.
class AdminFeedbackPageRoute extends StatefulWidget {
  /// Admin feedback page displaying details about feedback.
  const AdminFeedbackPageRoute({Key? key, required this.feedbackId}) : super(key: key);

  /// The id of the feedback to display.
  final int feedbackId;

  /// Info about this route.
  static final info = RouteInfo(
    routeName: "/admin/feedback/",
    builder: (_, args) => AdminFeedbackPageRoute(feedbackId: args["id"]),
    parent: AdminFeedbackRoute.info,
    args: {"id": int},
  );

  @override
  State<AdminFeedbackPageRoute> createState() => _AdminFeedbackPageRouteState();
}

class _AdminFeedbackPageRouteState extends State<AdminFeedbackPageRoute> {
  final commentController = TextEditingController();

  bool _commenmtInit = false;

  Future<RawApiResponse>? _updateFuture;
  Future<RawApiResponse>? _deleteFuture;

  _updateFeedback(WidgetRef ref, Feedback feedback) async {
    if (_updateFuture != null) return;

    var controller = ref.read(feedbackController);
    var feedbacks = ref.read(feedbackProvider);

    if (feedback.status.isUnread) {
      setState(() {
        _updateFuture = controller.updateFeedbackStatus(feedback.id, FeedbackStatus.read);
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
      _updateFuture = controller.updateFeedbackComment(feedback.id, commentController.text);
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
      AdminFeedbackPageRoute.info.push(context, params: {"id": nextFeedback.id});
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
        var feedback = ref.watch(feedbackProvider)[widget.feedbackId];

        if (feedback == null) return LpShimmer(height: AdminFeedbackItem.height);

        if (!_commenmtInit) {
          commentController.text = feedback.comment;
          _commenmtInit = true;
        }

        var user = ref.watch(usersProvider)[feedback.userId];

        if (user == null) return LpShimmer(height: AdminFeedbackItem.height);

        return LpContainer(
          title: feedback.type.title(context),
          leading: LpIcon(feedback.type.icon, color: feedback.type.color),
          trailing: ConditionalWidget(
            condition: _deleteFuture == null,
            trueWidget: (_) => HoverBuilder(
              builder: (context, hover) => LpIcon(
                Icons.delete,
                color: hover ? errorColor : neutralColor,
              ),
              onTap: () => lpShowConfirmDialog(
                context,
                title: t.admin_feedback_page_deleteTitle,
                message: t.admin_feedback_page_deleteText,
                confirmIsBad: true,
                onConfirm: () => _deleteFeedback(ref, feedback),
              ),
            ),
            falseWidget: (_) => LpLoadingIndicator.circular(color: errorColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NcSpacing.small(),
              LpFeedbackStatusTag(status: feedback.status),
              NcSpacing.small(),
              NcCaptionText(t.admin_feedback_page_author(user.fullname), fontSize: AdminFeedbackItem.fontSize, selectable: true),
              if (feedback.type.isBug) NcCaptionText(t.admin_feedback_page_logFile(feedback.logFile), fontSize: AdminFeedbackItem.fontSize, selectable: true),
              NcCaptionText(t.admin_feedback_page_id(feedback.id), fontSize: AdminFeedbackItem.fontSize, selectable: true),
              NcSpacing.large(),
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
                            child: NcBodyText(
                              feedback.content,
                              fontSize: AdminFeedbackItem.fontSize,
                              selectable: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              NcSpacing.large(),
              Expanded(
                child: LpTextField.filled(
                  multiline: true,
                  controller: commentController,
                  placeholder: t.admin_feedback_page_comment,
                ),
              ),
              NcSpacing.large(),
              Align(
                alignment: Alignment.centerRight,
                child: ConditionalWidget(
                  condition: _updateFuture != null,
                  trueWidget: (_) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NcCaptionText(feedback.status.isRead ? t.admin_feedback_page_update : t.admin_feedback_page_markRead, fontSize: AdminFeedbackItem.fontSize),
                      NcSpacing.small(),
                      LpLoadingIndicator.circular(),
                    ],
                  ),
                  falseWidget: (context) => LpTextButton(
                    text: feedback.status.isRead ? t.admin_feedback_page_update : t.admin_feedback_page_markRead,
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
