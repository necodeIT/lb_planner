import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:riverpod/riverpod.dart';

/// Provides a list of all [Feedback]s.
///
/// Note: The list will be empty if the user does not have the permission to view the feedbacks.
///
/// If you want to perform CRUD operations, use [feedbackProvider].
final feedbackProvider =
    AsyncNotifierProvider<FeedbackProviderState, List<Feedback>>(() {
  return FeedbackProviderState();
});

/// Exposes CRUD operations for [feedbackProvider].
///
/// If you only want to view the feedbacks, use [feedbackProvider].
final feedbackController = feedbackProvider.notifier;
