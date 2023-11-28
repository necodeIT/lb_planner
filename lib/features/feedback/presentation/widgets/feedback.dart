import 'package:flutter/material.dart';
import 'package:lb_planner/features/feedback/presentation/presentation.dart';
import 'package:lb_planner/shared/shared.dart';

/// Admin feedback subroute.
class AdminFeedbackRoute extends StatefulWidget {
  /// Admin feedback subroute.
  const AdminFeedbackRoute({Key? key}) : super(key: key);

  /// The font size of the header.
  static const double headerFontSize = 20;

  @override
  State<AdminFeedbackRoute> createState() => _AdminFeedbackRouteState();

  /// Sorts the given feedback list
  static List<Feedback> sortFeedbacks(List<Feedback> feedbacks) {
    feedbacks.sort(
      (a, b) {
        var status = a.status.index.compareTo(b.status.index);

        if (status != 0) return status;

        var timestamp = b.timestamp.compareTo(a.timestamp);

        return timestamp;
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

      var sortedFeedbacks =
          AdminFeedbackRoute.sortFeedbacks(feedbacks.values.toList());

      return ConditionalWidget(
        condition: sortedFeedbacks.isNotEmpty,
        trueWidget: (_) => Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_user,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600)
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_status,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600)
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600)
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_lastModified,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600),
          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_lastModifiedBy,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600),
          )
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_timestamp,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600),
          )
                    ),
                  ),
                ],
              ),
              Spacing.large(),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: [
                    for (var feedback in sortedFeedbacks) ...[
                      AdminFeedbackItem(feedbackId: feedback.id),
                      Spacing.medium(),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
        falseWidget: (_) => Center(
          child: Text(
            t.admin_feedback_noFeedback,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AdminFeedbackRoute.headerFontSize,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
      );
    });
  }
}
