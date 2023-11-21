import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/features/feedback/data/data.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [FeedbackDataSource] instance.
final feedbackDataSourceProvider = Provider<FeedbackDataSource>(
  (ref) {
    final apiService = ref.watch(apiServiceProvider);
    final userToken = ref.watch(userTokenProvider);

    return userToken.when(
      data: (token) => StdFeedbackDataSource(apiService, token),
      error: (_, __) => TokenUnavailableFeedbackDataSource(),
      loading: () => TokenUnavailableFeedbackDataSource(),
    );
  },
);
