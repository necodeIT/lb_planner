import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showPlaceHolderDialog(BuildContext context) {
  return showNcDialogOK(
      context,
      title: "Yet to be implemented",
      body: NcLoadingIndicator(),
      onConfirm: () {
        Navigator.of(context).pop();
      },
  );
}
