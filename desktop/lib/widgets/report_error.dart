import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class ErrorReporter extends StatelessWidget {
  const ErrorReporter({Key? key, required this.details}) : super(key: key);

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NcThemes.current.secondaryColor,
      child: Center(
        child: NcDialog(
          body: NcBodyText("details.context.toString()"),
          onConfirm: () {
            // TODO: send report as error-feedback
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
