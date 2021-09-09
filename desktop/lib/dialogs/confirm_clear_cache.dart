import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showConfirmClearCache(BuildContext context) {
  showNcDialog(
    context,
    title: "Clear Cache",
    body: NcCaptionText(
      "Are you you sure you want to clear your cache? You will be logged out.",
      overflow: TextOverflow.visible,
    ),
    confirmText: "Delete",
    onConfirm: () {
      // TODO: Clear cache
    },
  );
}
