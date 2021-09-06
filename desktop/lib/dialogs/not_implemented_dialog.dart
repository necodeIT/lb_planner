import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showPlaceHolderDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => NcDialog.ok(
      title: "Yet to be implemented",
      body: NcLoadingIndicator(),
      onConfirm: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
