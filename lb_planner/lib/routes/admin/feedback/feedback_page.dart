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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
