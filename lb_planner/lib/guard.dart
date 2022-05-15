import 'package:catcher/catcher.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/widgets.dart';
import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_utils/extensions.dart';
import 'package:nekolib_utils/log.dart';

/// Consumer wrapping the current route. Only use [WidgetRef.read].
WidgetRef get staticRef {
  if (_staticRef == null) throw "Not initialized";

  return _staticRef!;
}

WidgetRef? _staticRef;

_handleError(BuildContext context, WidgetRef ref, Object obj, [StackTrace? stackTrace]) {
  var controller = ref.read(feedbackController);
  var user = ref.read(userProvider);

  if (user.isEmpty) return;

  var message = obj.toString();
  var stack = stackTrace?.toString() ?? '';

  var feedback = Feedback(
    id: -1,
    userId: user.id,
    content: "----------------Auto generated feedback---------------\n\n$message\n\n----------------Stack trace---------------\n\n${stack.isEmpty ? 'No stack trace provided.' : stack}",
    type: FeedbackTypes.bug,
    status: FeedbackStatus.unread,
    logs: Logger.logs.join('\n'),
  );

  lpShowConfirmDialog(
    context,
    confirmIsBad: false,
    title: context.t.error_title,
    message: context.t.error_message(message),
    confirmText: context.t.error_report,
    cancelText: context.t.error_ingore,
    onConfirm: () => controller.submitFeedback(feedback),
  );
}

/// Updates the static [WidgetRef] and sets [Api.onError].
initGuard(WidgetRef ref) {
  _staticRef = ref;

  Api.onError = (response) => _handleError(ref as BuildContext, ref, response);
}

/// Report
class LpReportMode extends ReportMode {
  @override
  List<PlatformType> getSupportedPlatforms() => PlatformType.values;

  @override
  void requestAction(Report report, BuildContext? context) {
    context!;

    _handleError(staticRef as BuildContext, staticRef, report.errorDetails ?? report.error, report.stackTrace);
  }

  @override
  bool isContextRequired() => true;

  /// Default config for this report mode.
  static CatcherOptions get config => CatcherOptions(
        LpReportMode(),
        [],
        logger: _LpLogger(),
        reportOccurrenceTimeout: 60000 * 60 * 24,
        filterFunction: _filterReport,
      );
}

class _LpLogger extends CatcherLogger {
  ///Log info message.
  @override
  void info(String message) {
    log(message, LogTypes.debug);
  }

  ///Log fine message.
  @override
  void fine(String message) {
    log(message);
  }

  ///Log warning message.
  @override
  void warning(String message) {
    log(message, LogTypes.warning);
  }

  ///Log severe mesasge.
  @override
  void severe(String message) {
    log(message, LogTypes.fatal);
  }
}

final _dragErrors = [
  "The ParentDataWidget Positioned wants to apply",
];

bool _filterReport(Report report) {
  // Filter out error that occurse when dragging a module.
  return !_dragErrors.any(report.error.toString().containsCaseInsensitive);
}
