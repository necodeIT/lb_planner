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
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Wrap(
            // spacing: NcSpacing.xsSpacing,
            runSpacing: NcSpacing.mediumSpacing,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              for (var feedback in feedbacks.keys) ...[
                AdminFeedbackItem(feedbackId: feedback),
                NcSpacing.medium(),
              ]
            ],
          ),
        ),
      );
    });
  }
}
