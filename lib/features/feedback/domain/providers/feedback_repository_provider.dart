import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/features/feedback/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [FeedbackRepository] instance.
final feedbackRepositoryProvider = Provider<FeedbackRepository>(
  (ref) {
    final feedbackDataSource = ref.watch(feedbackDataSourceProvider);
    final user = ref.watch(userProvider);

    return StdFeedbackRepository(feedbackDataSource, user?.capabilities ?? []);
  },
);
