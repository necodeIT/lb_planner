import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/guard/error_cache_entry.dart';
import 'svg/error.dart';

// class NcGuard extends InheritedWidget {
//   NcGuard({required this.child}) : super(child: child);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return child;
//   }
// }

class Guard {
  static bool _showNextError = true;

  static const filedReportsKey = "filedReports";
  static const crashKey = "crash";

  static const badBoys = ["EXCEPTION CAUGHT BY RENDERING LIBRARY", "EXCEPTION CAUGHT BY WIDGETS LIBRAR"];

  static const noInfo = 'No information proivided.';
  static const defaultIngore = "Ignore";
  static const defaultSendReport = "Send Report";
  static const defaultOhNo = "Something went wrong!";

  static String _ingore = defaultIngore;
  static String _sendReport = defaultSendReport;
  static String _ohNo = defaultOhNo;

  static List<ErrorCacheEntry> _errorCache = List.empty(growable: true);

  static void init(BuildContext context) {
    _setErrorWidgetBuilder();
    _setFlutterErrorHandler(context);
  }

  static void setLabelMessages({String ignore = defaultIngore, String sendReport = defaultSendReport, String ohNo = defaultOhNo}) {
    _ingore = ignore;
    _sendReport = sendReport;
    _ohNo = ohNo;
  }

  static _pop(BuildContext context) => Navigator.of(context).pop();

  static _blockErrors() {
    _showNextError = false;
  }

  static _enableErrors() {
    _showNextError = true;
  }

  static reportError(BuildContext context, Object exception, StackTrace stack) {
    if (!_showNextError) return;

    // if (!kReleaseMode) return print(message);

    report(context, exception.toString(), ErrorCacheEntry(exception.toString(), stack.toString()));
  }

  static report(BuildContext context, String message, ErrorCacheEntry error, {Function()? onReportSent}) {
    _blockErrors();

    final skipReport = _errorCache.contains(error);

    if (skipReport) print("This error has already been reported. Skipping report option.");

    if (skipReport) {
      return showNcDialogOK(
        context,
        title: _ohNo,
        body: SingleChildScrollView(
          child: NcBodyText(
            message,
            overflow: TextOverflow.visible,
          ),
        ),
        onConfirm: () {
          _enableErrors();
          _pop(context);
        },
        confirmText: _ingore,
      );
    }
    showNcDialog(
      context,
      title: _ohNo,
      body: SingleChildScrollView(
        child: NcBodyText(
          message,
          overflow: TextOverflow.visible,
        ),
      ),
      onConfirm: () {
        // TODO: report error
        onReportSent?.call();
        _errorCache.add(error);
        _enableErrors();
        _pop(context);
      },
      onCancel: () {
        _pop(context);
        _enableErrors();
      },
      cancelText: _ingore,
      confirmText: _sendReport,
      buttonWidth: 130,
    );
  }

  static run(BuildContext context, Function body) {
    try {
      body();
    } catch (e, stack) {
      reportError(context, e, stack);
    }
  }

  static checkForRecentCrash(BuildContext context) {
    print("Guard.checkForRecentCrash(BuildContext context) is not implemented yet!");
    // SharedPreferences.getInstance().then(
    //   (prefs) {
    //     var crash = prefs.getString(crashKey);
    //     if (crash != null) report(context, "Application crashed last time", crash);
    //   },
    // );
  }

  static handleFlutterError(BuildContext context, FlutterErrorDetails details) {
    // if (!kReleaseMode) return FlutterError.dumpErrorToConsole(details);

    var error = ErrorCacheEntry(details.exception.toString(), details.stack.toString());

    if (badBoys.any(details.toString().contains)) return print("Error is derived from builderror. Skipping dialog.\n $details");

    String message = "Name: '${details.context != null ? details.context!.name ?? noInfo : noInfo}'\n---\nException: '${details.exception}'\n---\nStack: ${details.stack}\n---\nContext: ${details.context}";

    report(context, message, error);
  }

  static _setFlutterErrorHandler(BuildContext context) {
    FlutterError.onError = (details) => Guard.handleFlutterError(context, details);
  }

  static _setErrorWidgetBuilder() {
    ErrorWidget.builder = kReleaseMode
        ? (details) => LayoutBuilder(
              builder: (context, size) {
                final message = "Internal Error:  '${details.context != null ? details.context!.name ?? Guard.noInfo : Guard.noInfo}'. Please restart the application and try again.";

                return Center(
                  child: Column(
                    children: [
                      NcSpacing.small(),
                      NcVectorImage(
                        code: error_svg,
                        width: size.maxWidth * .8,
                      ),
                      NcSpacing.small(),
                      Tooltip(
                        message: message,
                        child: NcBodyText(message),
                      ),
                      NcSpacing.small(),
                    ],
                  ),
                );
              },
            )
        : ErrorWidget.builder;
  }
}

guard(BuildContext context, Function body) => Guard.run(context, body);
