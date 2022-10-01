part of lbplanner_helpers;

/// Consumer wrapping the current route. Only use [WidgetRef.read].
WidgetRef get staticRef {
  if (_staticRef == null) throw "Not initialized";

  return _staticRef!;
}

WidgetRef? _staticRef;

_handleError(BuildContext context, WidgetRef ref, Object obj, [StackTrace? stackTrace]) {
  if (!InternetProvider.connected) return;

  var user = ref.read(userProvider);

  if (user.invalid) return;

  var controller = ref.read(feedbackController);

  if (user.invalid) return;

  var message = obj.toString();
  var stack = stackTrace?.toString() ?? '';

  var feedback = Feedback(
    timestamp: DateTime.now(),
    id: -1,
    userId: user.id,
    content: "----------------Auto generated feedback---------------\n\n$message\n\n----------------Stack trace---------------\n\n${stack.isEmpty ? 'No stack trace provided.' : stack}",
    type: FeedbackTypes.bug,
    status: FeedbackStatus.unread,
    logFile: Logger.logFileName,
  );

  lpShowConfirmDialog(
    context,
    confirmIsBad: false,
    title: context.t.guard_dialog_title,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NcCaptionText(
          context.t.guard_dialog_description,
          overflow: TextOverflow.visible,
        ),
        NcSpacing.medium(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(NcSpacing.smallSpacing),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kRadius),
            color: secondaryColor,
          ),
          child: NcCaptionText(
            message,
            selectable: true,
            overflow: TextOverflow.visible,
          ),
        ),
        NcSpacing.medium(),
        NcCaptionText(
          context.t.guard_dialog_consent,
          overflow: TextOverflow.visible,
        ),
      ],
    ),
    confirmText: context.t.guard_dialog_sendReport,
    cancelText: context.t.guard_dialog_ingore,
    onConfirm: () => controller.submitFeedback(feedback),
  );
}

/// Updates the static [WidgetRef] and sets [Api.onError].
initGuard(WidgetRef ref) {
  _staticRef = ref;

  Api.onError = (response) {
    if (!_filterError(response.errorMessage)) return;

    _handleError(ref as BuildContext, ref, response);
  };
}

/// Report
class LpReportMode extends ReportMode {
  @override
  List<PlatformType> getSupportedPlatforms() => PlatformType.values;

  @override
  void requestAction(Report report, BuildContext? context) {
    context!;

    _handleError(staticRef as BuildContext, staticRef, report.errorDetails ?? report.error, report.stackTrace);

    if (kDebugMode && report.errorDetails != null) FlutterError.dumpErrorToConsole(report.errorDetails!, forceReport: true);
  }

  @override
  bool isContextRequired() => true;

  /// Timeout for reports to prevent handling duplicates of same error. In milliseconds.
  static const timeout = 60000 * 60 * 24;

  /// Default config for this report mode.
  static CatcherOptions get config => CatcherOptions(
        LpReportMode(),
        [],
        logger: _LpLogger(),
        reportOccurrenceTimeout: timeout,
        filterFunction: (r) => _filterError(r.error.toString()),
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

const _ignoreList = [
  "setState() or markNeedsBuild() called during build.",
  "Connection closed before full header was received",
  "clipboard has strings",
  "PlatformException(Clipboard error, Unable to open clipboard, 5,",
  "cached files cannot be used by the cache manageranymore.:",
  "connection timed out",
  "Bad state: Tried to use PlanProvider after `dispose` was called.",
];

bool _filterError(String report) {
  return !_ignoreList.any(report.containsCaseInsensitive) && currentRoute != UpdateRoute.info;
}
