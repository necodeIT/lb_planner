part of lbplanner_widgets;

/// Themed [Dialog] widget.
class LpDialog extends StatefulWidget {
  /// Themed ConfirmDialog widget.
  LpDialog.confirm({
    Key? key,
    required this.title,
    required this.body,
    this.confirmText,
    this.cancelText,
    required this.onConfirm,
    this.onCancel,
    required this.removeFromWidgetTree,
    this.confirmIsBad = true,
    required this.scrollable,
  }) : super(key: key) {
    confirmOnly = false;
  }

  /// Themed [AlertDialog] widget with just one button.
  LpDialog.alert({
    Key? key,
    required this.title,
    required this.body,
    this.onConfirm,
    this.confirmText,
    required this.removeFromWidgetTree,
    required this.scrollable,
  }) : super(key: key) {
    confirmIsBad = false;
    confirmOnly = true;
  }

  /// The title of the dialog.
  final String title;

  /// The body of the dialog.
  final Widget body;

  /// Whether the confirm button should have [errorColor] as it's background color.
  late final bool confirmIsBad;

  /// The text of the confirm button.
  final String? confirmText;

  /// The text of the cancel button.
  late final String? cancelText;

  /// The boolean that determines if the dialog has just one button.
  late final bool confirmOnly;

  /// Whether the dialog body should be scrollable.
  final bool scrollable;

  /// The callback that is called when the user confirms the dialog.
  final Function()? onConfirm;

  /// Called when the dialog has to be removed from the widget tree.
  final VoidCallback removeFromWidgetTree;

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

  /// The font size of the [title].
  static const double titleFontSize = 30;

  @override
  State<LpDialog> createState() => _LpDialogState();
}

class _LpDialogState extends State<LpDialog> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: kNormalAnimationDuration);
    _controller.forward();
    super.initState();
  }

  Future _removeFromWidgetTree() async {
    await _controller.reverse();
    widget.removeFromWidgetTree();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      // ignore: no-magic-number
      opacity: Tween<double>(begin: 0.4, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 0.5),
        ),
      ),
      child: ScaleTransition(
        child: AlertDialog(
          title: NcTitleText(widget.title, fontSize: LpDialog.titleFontSize),
          titlePadding: EdgeInsets.all(LpDialog.padding),
          buttonPadding: EdgeInsets.only(left: LpDialog.padding, right: LpDialog.padding),
          contentPadding: EdgeInsets.only(bottom: LpDialog.padding, left: LpDialog.padding, right: LpDialog.padding),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * LpDialog.widthFactor,
              maxHeight: MediaQuery.of(context).size.height * LpDialog.heightFactor,
              maxWidth: MediaQuery.of(context).size.width * LpDialog.widthFactor,
            ),
            child: AnimatedSize(
              duration: kNormalAnimationDuration,
              curve: kAnimationCurve,
              child: ConditionalWrapper(
                condition: widget.scrollable,
                wrapper: (context, child) => SingleChildScrollView(
                  controller: ScrollController(),
                  child: child,
                ),
                child: widget.body,
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!widget.confirmOnly)
                  LpButton(
                    text: widget.cancelText ?? context.t.dialog_cancel,
                    color: widget.confirmIsBad ? accentColor : errorColor,
                    fontSize: LpDialog.btnFontSize,
                    padding: LpDialog.btnPadding,
                    onPressed: () async {
                      await _removeFromWidgetTree();
                      widget.onCancel?.call();
                    },
                  ),
                NcSpacing.medium(),
                LpButton(
                  text: widget.confirmText ?? (widget.confirmOnly ? context.t.alertDialog_confirm : context.t.dialog_confirm),
                  color: widget.confirmIsBad ? errorColor : accentColor,
                  fontSize: LpDialog.btnFontSize,
                  padding: LpDialog.btnPadding,
                  onPressed: () async {
                    await _removeFromWidgetTree();
                    widget.onConfirm?.call();
                  },
                ),
              ],
            )
          ],
          backgroundColor: NcThemes.current.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kRadius)),
          ),
        ),
        // ignore: no-magic-number
        scale: Tween<double>(begin: 1, end: 0.85).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.5, curve: kDialogAnimationCurve),
          ),
        ),
      ),
    );
  }
}

/// Themed ConfirmDialog widget.
void lpShowConfirmDialog(
  BuildContext context, {
  required String title,
  Widget? body,
  String? confirmText,
  String? cancelText,
  Function()? onConfirm,
  Function()? onCancel,
  String? message,
  bool confirmIsBad = true,
  bool scrollable = true,
}) {
  assert(body != null || message != null, 'Either body or message must be provided.');

  OverlayEntry? dialogOverLay;
  OverlayEntry background = _generateBackground();

  var dialog = LpDialog.confirm(
    title: title,
    body: ConditionalWidget(
      condition: body != null,
      trueWidget: (_) => body!,
      falseWidget: (_) => NcCaptionText(
        message!,
        overflow: TextOverflow.visible,
      ),
    ),
    confirmText: confirmText,
    cancelText: cancelText,
    onConfirm: onConfirm,
    onCancel: onCancel,
    confirmIsBad: confirmIsBad,
    scrollable: scrollable,
    removeFromWidgetTree: () {
      dialogOverLay!.remove();
      background.remove();
    },
  );

  dialogOverLay = OverlayEntry(
    builder: (context) => dialog,
  );

  Overlay.of(context)!.insert(background);
  Overlay.of(context)!.insert(dialogOverLay);
}

/// Themed [AlertDialog] widget.
void lpShowAlertDialog(
  BuildContext context, {
  required String title,
  Widget? body,
  String? message,
  String? confirmText,
  Function()? onConfirm,
  bool scrollable = true,
}) {
  assert(body != null || message != null, 'Either body or message must be provided.');

  OverlayEntry? dialogOverLay;
  OverlayEntry background = _generateBackground();

  var dialog = LpDialog.alert(
    title: title,
    body: ConditionalWidget(
      condition: body != null,
      trueWidget: (_) => body!,
      falseWidget: (_) => NcCaptionText(
        message!,
        overflow: TextOverflow.visible,
      ),
    ),
    onConfirm: onConfirm,
    confirmText: confirmText,
    scrollable: scrollable,
    removeFromWidgetTree: () {
      dialogOverLay!.remove();
      background.remove();
    },
  );

  dialogOverLay = OverlayEntry(
    builder: (context) => dialog,
  );

  Overlay.of(context)!.insert(background);
  Overlay.of(context)!.insert(dialogOverLay);
}

OverlayEntry _generateBackground() {
  return OverlayEntry(
    builder: (context) => AbsorbPointer(
      child: Container(
        color: Colors.black38,
      ),
    ),
  );
}
