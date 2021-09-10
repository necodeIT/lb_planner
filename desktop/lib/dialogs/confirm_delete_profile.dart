import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

showDeleteProfileDialog(BuildContext context) {
  return showNcDialog(
      context, 
      title: "Delete Profile",
      body: NcCaptionText("Are you sure you want to delete your profile? All data will be permanetly erased."),
      confirmText: "Delete",
      onConfirm: () {
        // TODO: Delete Profile
      },
      onCancel: (){
        Navigator.of(context).pop();
        },
  );
}
