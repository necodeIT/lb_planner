import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showDeleteProfileDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => NcDialog(
      title: "Delete Profile",
      body: NcCaptionText("Are you sure you want to delete your profile?"),
      confirmText: "Delete",
      onConfirm: () {
        // TODO: Delete Profile
      },
      onCancel: (){
        Navigator.of(context).pop();
        },
    ),
  );
}
