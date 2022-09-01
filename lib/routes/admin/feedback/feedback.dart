part of lbplanner_routes;

/// Admin feedback subroute.
class AdminFeedbackRoute extends StatefulWidget {
  /// Admin feedback subroute.
  const AdminFeedbackRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(
    routeName: "/admin/feedback",
    builder: (_, __) => AdminFeedbackRoute(),
    titleGenerator: (t) => t.admin_feedback_routeName,
    parent: AdminDashboardRoute.info,
  );

  /// The font size of the header.
  static const double headerFontSize = 20;

  @override
  State<AdminFeedbackRoute> createState() => _AdminFeedbackRouteState();

  /// Sorts the given feedback list
  static List<Feedback> sortFeedbacks(List<Feedback> feedbacks) {
    feedbacks.sort(
      (a, b) {
        var status = a.status.index.compareTo(b.status.index);

        if (status == 1) return status;

        var type = a.type == b.type
            ? 0
            : a.type.isBug && b.type.isError
                ? -1
                : a.type.isError && b.type.isBug
                    ? 1
                    : a.type.isBug || a.type.isError
                        ? -1
                        : a.type.isSuggestion && !b.type.isOther
                            ? 1
                            : a.type.index.compareTo(b.type.index);

        if (type == 0) return b.timestamp.compareTo(a.timestamp);

        return type;
      },
    );

    return feedbacks;
  }
}

class _AdminFeedbackRouteState extends State<AdminFeedbackRoute> {
  FeedbackProvider? _feedbackController;

  _startAutoRefresh(WidgetRef ref) {
    _feedbackController = ref.read(feedbackController);

    _feedbackController?.startAutoRefresh();
  }

  @override
  void dispose() {
    _feedbackController?.pauseAutoRefresh();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var feedbacks = ref.watch(feedbackProvider);
      _startAutoRefresh(ref);

      var sortedFeedbacks = AdminFeedbackRoute.sortFeedbacks(feedbacks.values.toList());

      return ConditionalWidget(
        condition: sortedFeedbacks.isNotEmpty,
        trueWidget: (_) => Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: NcCaptionText(
                      t.admin_feedback_headers_user,
                      fontSize: AdminFeedbackRoute.headerFontSize,
                    ),
                  ),
                  Expanded(
                    child: NcCaptionText(
                      t.admin_feedback_headers_status,
                      fontSize: AdminFeedbackRoute.headerFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: NcCaptionText(
                      t.admin_feedback_headers_type,
                      fontSize: AdminFeedbackRoute.headerFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: NcCaptionText(
                      t.admin_feedback_headers_lastModified,
                      fontSize: AdminFeedbackRoute.headerFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: NcCaptionText(
                      t.admin_feedback_headers_lastModifiedBy,
                      fontSize: AdminFeedbackRoute.headerFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: NcCaptionText(
                      t.admin_feedback_headers_timestamp,
                      fontSize: AdminFeedbackRoute.headerFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              NcSpacing.large(),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: [
                    for (var feedback in sortedFeedbacks) ...[
                      AdminFeedbackItem(feedbackId: feedback.id),
                      NcSpacing.medium(),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
        falseWidget: (_) => Center(
          child: NcCaptionText(
            t.admin_feedback_noFeedback,
            fontSize: AdminFeedbackRoute.headerFontSize,
          ),
        ),
      );
    });
  }
}
