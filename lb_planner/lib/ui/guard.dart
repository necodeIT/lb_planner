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

reportError(BuildContext context, {Exception? exception, FlutterErrorDetails? error}) {
  String message = "${exception ?? error ?? 'No information provided.'}";
  // String message = 'No information provided.';

  return showDialog(
    context: context,
    builder: (context) => NcDialog(
      title: "Something went wrong!",
      body: SingleChildScrollView(
        child: NcBodyText(message),
      ),
      onConfirm: () {
        // TODO: report error
        Navigator.of(context).pop();
      },
      confirmText: "Send Report",
      buttonWidth: 130,
    ),
  );
}

guard(BuildContext context, Function body) {
  try {
    body();
  } catch (e) {
    reportError(context, exception: e as Exception);
  }
}
