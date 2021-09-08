import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showFeedbackDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => NcDialog.ok(
      title: "Thank you for your feedback!",
      body: NcCaptionText("We will use your feedback to improve your experience :)", overflow: TextOverflow.visible,),
    ),
  );
}
