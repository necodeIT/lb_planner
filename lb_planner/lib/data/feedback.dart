import 'package:lb_planner/data/enums/feedback_type.dart';
import 'package:lb_planner/data/enums/feeedback_status.dart';

class Feedback {
  Feedback(this.type, this.author, this.content);

  final FeedbackType type;
  final int author;
  final String content;

  FeedbackStatus status = FeedbackStatus.Unread;
  String notes = "";
}
