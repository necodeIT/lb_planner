import 'package:flutter/material.dart' hide Feedback;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/feedback/presentation/presentation.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/feedback/domain/domain.dart';
import 'package:lb_planner/features/feedback/presentation/widgets/widgets.dart';

/// Admin feedback subroute.
class AdminFeedbackRoute extends StatefulWidget {
  /// Admin feedback subroute.
  const AdminFeedbackRoute({Key? key}) : super(key: key);

  /// The font size of the header.
  static const double headerFontSize = 20;

  @override
  State<AdminFeedbackRoute> createState() => _AdminFeedbackRouteState();

  /// Sorts the given feedback list
  static List<Feedback>? sortFeedbacks(AsyncValue<List<Feedback>> feedbacks) {
    feedbacks.value!.sort(
      (a, b) {
        var status = a.readAsInt.compareTo(b.readAsInt);

        if (status != 0) return status;

        var timestamp = b.createdAt.compareTo(a.createdAt);

        return timestamp;
      },
    );

    return feedbacks.value;
  }
}

class _AdminFeedbackRouteState extends State<AdminFeedbackRoute> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var feedbacks = ref.watch(feedbackProvider);

      var sortedFeedbacks = AdminFeedbackRoute.sortFeedbacks(feedbacks);

      return ConditionalWidget(
        ifFalse: Center(
          child: Text(
            t.admin_feedback_noFeedback,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: AdminFeedbackRoute.headerFontSize,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        condition: sortedFeedbacks!.isNotEmpty,
        ifTrue: Align(
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_status,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: AdminFeedbackRoute.headerFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: AdminFeedbackRoute.headerFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_lastModified,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: AdminFeedbackRoute.headerFontSize,
                        fontWeight: FontWeight.w600,
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      t.admin_feedback_headers_timestamp,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: AdminFeedbackRoute.headerFontSize,
                        fontWeight: FontWeight.w600,
                      ),
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
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}