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

      return Align(
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
                    t.admin_feedback_headers_id,
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
                  for (var feedback in feedbacks.keys) ...[
                    AdminFeedbackItem(feedbackId: feedback),
                    NcSpacing.medium(),
                  ]
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
