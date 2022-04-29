part of lbplanner_widgets;

/// Themed [Dialog] widget.
class LpDialog extends StatelessWidget {
  /// Themed ConfirmDialog widget.
  LpDialog.confirm({Key? key, required this.title, required this.body, this.confirmText, this.cancelText, required this.onConfirm, this.onCancel}) : super(key: key) {
    confirmOnly = false;
  }

  /// Themed [AlertDialog] widget with just one button.
  LpDialog.alert({Key? key, required this.title, required this.body, this.onConfirm, this.confirmText}) : super(key: key) {
    confirmOnly = true;
  }

  /// The title of the dialog.
  final String title;

  /// The body of the dialog.
  final Widget body;

  /// The text of the confirm button.
  final String? confirmText;

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

  /// The font size of the buttons in the dialog.
  static const double btnFontSize = 16;

  /// The padding of the buttons in the dialog.
  static const double btnPadding = 14;

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
            if (!confirmOnly)
              LpButton(
                text: cancelText ?? context.t.dialog_cancel,
                fontSize: btnFontSize,
                padding: btnPadding,
                color: errorColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  onCancel?.call();
                },
              ),
            NcSpacing.medium(),
            LpButton(
              text: confirmText ?? (confirmOnly ? context.t.alertDialog_confirm : context.t.dialog_confirm),
              fontSize: btnFontSize,
              padding: btnPadding,
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm?.call();
              },
            ),
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

/// Themed ConfirmDialog widget.
void lpShowConfirmDialog(BuildContext context, {required String title, required Widget body, String? confirmText, String? cancelText, Function()? onConfirm, Function()? onCancel}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: kNormalAnimationDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return shrinkAnimation(animation, secondaryAnimation, child);
    },
    pageBuilder: (animation, secondaryAnimation, child) {
      return LpDialog.confirm(
        title: title,
        body: body,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}

/// Themed [AlertDialog] widget.
void lpShowAlertDialog(BuildContext context, {required String title, required Widget body, String? confirmText, Function()? onConfirm}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: kNormalAnimationDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return shrinkAnimation(animation, secondaryAnimation, child);
    },
    pageBuilder: (animation, secondaryAnimation, child) {
      return LpDialog.alert(
        title: title,
        body: body,
        confirmText: confirmText,
        onConfirm: onConfirm,
      );
    },
  );
}

/// Shrinkanimation for the dialogs.
shrinkAnimation(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(
    child: child,
    scale: Tween<double>(begin: 1, end: 0.85).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 0.5, curve: kDialogAnimationCurve),
      ),
    ),
  );
}
