library lbplanner_api;

export 'models/user/user.dart';
export 'models/notification/notification.dart';
export 'models/module/module.dart';
export 'models/invite/invite.dart';
export 'models/plan/plan.dart';
export 'models/course/course.dart';
export 'models/statistics/statistics.dart';
export 'models/feedback/feedback.dart';
export 'models/deadline/deadline.dart';

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:nekolib_utils/log.dart';
import 'package:riverpod/riverpod.dart';

// Project imports:
import 'models/feedback/feedback.dart';
import 'models/module/module.dart';
import 'models/notification/notification.dart';
import 'models/plan/plan.dart';
import 'models/user/user.dart';

// Models

part 'models/languages.dart';
part 'models/user/user_access_levels.dart';
part 'models/notification/notification_types.dart';
part 'models/notification/notification_status.dart';
part 'models/module/module_grades.dart';
part 'models/module/module_types.dart';
part 'models/module/module_status.dart';
part 'models/plan/plan_access_types.dart';
part 'models/invite/invite_status.dart';
part 'models/feedback/feedback_types.dart';
part 'models/feedback/feedback_status.dart';

// Providers

part 'providers/user_provider.dart';
part 'providers/notifications_provider.dart';

// Api

part 'api/api.dart';
part 'api/api_response.dart';
part 'api/user_api.dart';
part 'api/utils/map_extensions.dart';
part 'api/utils/response.dart';
part 'api/api_services.dart';
part 'api/notifications_api.dart';
part 'api/plan_api.dart';
part 'api/feedback_api.dart';
part 'api/modules_api.dart';

/// The rate with which the api refreshes underlying data
const kApiRefreshRate = Duration(seconds: 5);
