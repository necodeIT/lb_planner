import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

// class NcGuard extends InheritedWidget {
//   NcGuard({required this.child}) : super(child: child);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return child;
//   }
// }

const noInfo = 'No information proivided';

class Guard {
  static bool _showNextError = true;

  static _blockErrors() {
    _showNextError = false;
  }

  static _enableErrors() {
    _showNextError = true;
  }

  static reportError(BuildContext context, {Exception? exception, FlutterErrorDetails? error}) {
    if (!_showNextError) return;

    String message = "${exception ?? error ?? noInfo}";
    message = noInfo;

    if (!kReleaseMode) return print(message);

    // print(message);
    _blockErrors();

    showDialog(
      context: context,
      builder: (context) {
        return NcDialog(
          title: "Something went wrong!",
          body: SingleChildScrollView(
            child: NcBodyText(
              message,
              overflow: TextOverflow.visible,
            ),
          ),
          onConfirm: () {
            // TODO: report error
            Navigator.of(context).pop();
            _enableErrors();
          },
          onCancel: _enableErrors,
          confirmText: "Send Report",
          buttonWidth: 130,
        );
      },
    );
  }

  static run(BuildContext context, Function body) {
    try {
      body();
    } catch (e) {
      reportError(context, exception: e as Exception);
    }
  }
}

guard(BuildContext context, Function body) => Guard.run;
