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

reportError(BuildContext context, Exception? exception, FlutterErrorDetails? error) {
  showDialog(
    context: context,
    builder: (context) => NcDialog(
      title: "Something went wrong!",
      body: NcBodyText(),
      onConfirm: () {
        // TODO: report error
        Navigator.of(context).pop();
      },
    ),
  );
}

guard(BuildContext context, Function body) {
  try {
    body();
  } catch (e) {
    reportError(context, e as Exception);
  }
}
