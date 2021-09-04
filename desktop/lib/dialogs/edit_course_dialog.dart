import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showEditCourseDialog(BuildContext context, int id) {
  return showDialog(
    context: context,
    builder: (context) => NcDialog.ok(
      title: "Course Settings",
      body: NcLoadingIndicator(),
      onConfirm: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
