part of lbplanner_widgets;

/// Themed [AlertDialog] widget.
class LpDialog extends StatelessWidget {
  /// Themed [AlertDialog] widget.
  LpDialog({Key? key, this.title = "", required this.body, this.confirmText = "Confirm", this.cancelText = "Cancel", required this.onConfirm, this.onCancel}) : super(key: key) {
    confirmOnly = false;
  }

  /// Themed [AlertDialog] widget with just one button.
  LpDialog.ok({Key? key, required this.title, required this.body, this.onConfirm, this.confirmText = "OK"}) : super(key: key) {
    confirmOnly = true;
  }

  /// The title of the dialog.
  final String title;

  /// The body of the dialog.
  final Widget body;

  /// The text of the confirm button.
  final String confirmText;

  /// The text of the cancel button.
  late final String? cancelText;

  /// The boolean that determines if the dialog has just one button.
  late final bool confirmOnly;

  /// The callback that is called when the user confirms the dialog.
  final Function()? onConfirm;

  /// The callback that is called when the user cancels the dialog.
  late final Function()? onCancel;

  /// The padding between the elements in the dialog.
  static const double padding = 20;

  /// The width factor of the body in the dialog.
  static const double widthFactor = .5;

  /// The height factor of the body in the dialog.
  static const double heightFactor = .8;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: NcTitleText(title, fontSize: 30),
      titlePadding: EdgeInsets.all(padding),
      buttonPadding: EdgeInsets.only(left: padding, right: padding),
      contentPadding: EdgeInsets.only(bottom: padding, left: padding, right: padding),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * widthFactor,
          maxHeight: MediaQuery.of(context).size.height * heightFactor,
          maxWidth: MediaQuery.of(context).size.width * widthFactor,
        ),
        child: body,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!confirmOnly) LpButton(text: cancelText ?? "", onPressed: onCancel ?? Navigator.of(context).pop),
            NcSpacing.medium(),
            LpButton(text: confirmText, onPressed: onConfirm ?? Navigator.of(context).pop),
          ],
        )
      ],
      backgroundColor: NcThemes.current.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kRadius)),
      ),
    );
  }
}
