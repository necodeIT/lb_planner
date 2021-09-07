import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcDialog extends StatelessWidget {
  NcDialog({Key? key, this.title = "", required this.body, this.confirmText = "Confirm", this.cancelText = "Cancel", required this.onConfirm, this.onCancel, this.width = defaultWidth, this.label, this.buttonWidth = defaultButtonWidth})
      : super(key: key) {
    confirmOnly = false;
  }
  NcDialog.ok({Key? key, required this.title, required this.body, this.onConfirm, this.confirmText = "OK", this.width = defaultWidth, this.label, this.buttonWidth = defaultButtonWidth}) : super(key: key) {
    confirmOnly = true;
  }

  final String title;
  final Widget? label;
  final Widget body;
  final String confirmText;
  final double width;
  final double buttonWidth;
  late final String? cancelText;
  late final bool confirmOnly;

  final Function()? onConfirm;
  late final Function()? onCancel;

  static const double padding = 20;
  static const double defaultWidth = 400;
  static const double defaultButtonWidth = 100;

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty && label == null) throw ArgumentError("Please define either a label or a title!");

    return AlertDialog(
      title: label ?? NcTitleText(title, fontSize: 30),
      titlePadding: EdgeInsets.all(padding),
      buttonPadding: EdgeInsets.only(left: padding, right: padding),
      contentPadding: EdgeInsets.only(bottom: padding, left: padding, right: padding),
      content: Container(
        child: body,
        width: width,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!confirmOnly) NcButton.cancel(text: cancelText ?? "", onTap: onCancel ?? Navigator.of(context).pop, width: buttonWidth),
            NcSpacing.medium(),
            NcButton(text: confirmText, onTap: onConfirm ?? Navigator.of(context).pop, width: buttonWidth),
          ],
        )
      ],
      backgroundColor: NcThemes.current.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(ncRadius)),
      ),
    );
  }
}
