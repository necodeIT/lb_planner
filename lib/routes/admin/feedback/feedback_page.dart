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
    builder: (_, params) => AdminFeedbackPageRoute(feedbackId: params["id"]),
    parent: AdminFeedbackRoute.info,
    params: {"id": int},
  );

  @override
  State<AdminFeedbackPageRoute> createState() => _AdminFeedbackPageRouteState();
}

class _AdminFeedbackPageRouteState extends State<AdminFeedbackPageRoute> {
  final commentController = TextEditingController();

  bool _commenmtInit = false;

  Future<RawApiResponse>? _updateFuture;

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

      if (response!.succeeded) {
        if (feedbacks.values.any((f) => f.id > feedback.id)) {
          var nexFeedback = feedbacks.values.firstWhere((f) => f.id > feedback.id);
          AdminFeedbackPageRoute.info.push(context, params: {"id": nexFeedback.id});
        } else {
          AdminFeedbackRoute.info.push(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement delete functionality
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
          trailing: LpFeedbackStatusTag(status: feedback.status),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NcCaptionText(t.admin_feedback_page_author(user.fullname), fontSize: AdminFeedbackItem.fontSize),
              NcCaptionText(t.admin_feedback_page_id(feedback.id), fontSize: AdminFeedbackItem.fontSize),
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
