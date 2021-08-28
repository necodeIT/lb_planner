import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcConfirmDialog extends StatelessWidget {
  NcConfirmDialog({Key? key, required this.title, required this.body, this.confirmText = "Confirm", this.cancelText = "Cancel", required this.onConfirm, required this.onCancel, this.width = 100}) : super(key: key) {
    confirmOnly = false;
  }
  NcConfirmDialog.ok({Key? key, required this.title, required this.body, required this.onConfirm, this.confirmText = "OK", this.width = 100}) : super(key: key) {
    confirmOnly = true;
    onCancel = null;
  }

  final String title;
  final Widget body;
  final String confirmText;
  final double? width;
  late final String? cancelText;
  late final bool confirmOnly;

  final Function() onConfirm;
  late final Function()? onCancel;

  static const double padding = 20;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: NcTitleText(title, fontSize: 30),
      titlePadding: EdgeInsets.all(padding),
      buttonPadding: EdgeInsets.only(left: padding, right: padding),
      contentPadding: EdgeInsets.only(bottom: padding, left: padding, right: padding),
      content: body,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!confirmOnly) NcButton.cancel(text: cancelText ?? "", onTap: onCancel ?? () {}, width: width),
            NcSpacing.width(),
            NcButton(text: confirmText, onTap: onConfirm, width: width),
          ],
        )
      ],
      backgroundColor: NcThemes.current.tertiaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(ncRadius)),
      ),
    );
  }
}
