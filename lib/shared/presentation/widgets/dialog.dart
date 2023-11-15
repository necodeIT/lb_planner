import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb_planner/shared/shared.dart';

/// Shows custom dialogs
class Dialog extends StatefulWidget {
  /// Creates the structure of the confirm dialog
  Dialog.confirm({
    Key? key,
    required this.header,
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

  /// Creates the structure of the alert dialog
  Dialog.alert({
    Key? key,
    required this.header,
    required this.body,
    this.onConfirm,
    this.confirmText,
    required this.removeFromWidgetTree,
    required this.scrollable,
  }) : super(key: key) {
    confirmIsBad = false;
    confirmOnly = true;
  }

  /// The header of the dialog.
  final Widget? header;

  /// The body of the dialog.
  final Widget body;

  /// Whether the confirm button should have errorColor as it's background color.
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

  /// The font size of the title.
  static const double titleFontSize = 30;

  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _controller.forward();
    super.initState();
    focusNode.addListener(_ensureFocus);

    focusNode.requestFocus();
  }

  /// Removes the widget from the widget tree.
  Future close() async {
    await _controller.reverse();
    widget.removeFromWidgetTree();
  }

  ///Ensures focus if the focusNode doesn't have focus.
  void _ensureFocus() async {
    if (focusNode.hasFocus) return;

    await Future.delayed(Duration(milliseconds: 300));

    if (!mounted) return;

    focusNode.requestFocus();
  }

  final focusNode = FocusNode(skipTraversal: true);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: focusNode,
      onKey: (event) {
        if (event.logicalKey == LogicalKeyboardKey.escape &&
            focusNode.hasPrimaryFocus) {
          close();
        }
      },
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.4, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.5),
          ),
        ),
        child: ScaleTransition(
          child: AlertDialog(
            title: widget.header,
            titlePadding: EdgeInsets.all(Dialog.padding),
            buttonPadding:
                EdgeInsets.only(left: Dialog.padding, right: Dialog.padding),
            contentPadding: EdgeInsets.only(
                bottom: Dialog.padding,
                left: Dialog.padding,
                right: Dialog.padding),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth:
                    MediaQuery.of(context).size.width * Dialog.widthFactor,
                maxHeight:
                    MediaQuery.of(context).size.height * Dialog.heightFactor,
                maxWidth:
                    MediaQuery.of(context).size.width * Dialog.widthFactor,
              ),
              child: AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                child: ConditionalWrapper(
                  condition: widget.scrollable,
                  wrapper: (context, child) => SingleChildScrollView(
                    controller: ScrollController(),
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: child,
                    ),
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
                    ElevatedButton(
                      child: Text(widget.cancelText ?? t.dialog_cancel),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.confirmIsBad
                            ? context.theme.colorScheme.primary
                            : context.theme.colorScheme.error,
                        textStyle: TextStyle(fontSize: Dialog.btnFontSize),
                        padding: EdgeInsets.all(Dialog.btnPadding),
                      ),
                      onPressed: () async {
                        await close();
                        widget.onCancel?.call();
                      },
                    ),
                  Spacing.medium(),
                  ElevatedButton(
                    child: Text(widget.confirmText ??
                        (widget.confirmOnly
                            ? t.alertDialog_confirm
                            : t.dialog_confirm)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.confirmIsBad
                          ? context.theme.colorScheme.error
                          : context.theme.colorScheme.primary,
                      textStyle: TextStyle(fontSize: Dialog.btnFontSize),
                      padding: EdgeInsets.all(Dialog.btnPadding),
                    ),
                    onPressed: () async {
                      await close();
                      widget.onConfirm?.call();
                    },
                  ),
                ],
              )
            ],
            backgroundColor: context.theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          // ignore: no-magic-number
          scale: Tween<double>(begin: 1, end: 0.85).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(0.0, 0.5, curve: Curves.easeOut),
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows an confirm dialog
void showConfirmDialog(
  BuildContext context, {
  String? title,
  Widget? header,
  Widget? body,
  String? confirmText,
  String? cancelText,
  Function()? onConfirm,
  Function()? onCancel,
  String? message,
  bool confirmIsBad = true,
  bool scrollable = true,
}) {
  assert(body != null || message != null,
      'Either body or message must be provided.');
  assert(header != null || title != null,
      'Either header or title must be provided.');

  var key = GlobalKey<_DialogState>();

  OverlayEntry? dialogOverLay;
  OverlayEntry background =
      _generateBackground(() => key.currentState!.close());

  var dialog = Dialog.confirm(
    key: key,
    header: header ??
        Text(
          title!,
          style: TextStyle(fontSize: Dialog.titleFontSize),
        ),
    body: ConditionalWidget(
      condition: body != null,
      ifTrue: body!,
      ifFalse: Text(message!,
          style: TextStyle(
              overflow: TextOverflow.visible,
              fontSize: 12,
              letterSpacing: 0.4)),
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

  Overlay.of(context).insert(background);
  Overlay.of(context).insert(dialogOverLay);
}

/// Shows an alert dialog
void showAlertDialog(
  BuildContext context, {
  String? title,
  Widget? header,
  Widget? body,
  String? message,
  String? confirmText,
  Function()? onConfirm,
  bool scrollable = true,
}) {
  assert(body != null || message != null,
      'Either body or message must be provided.');
  assert(header != null || title != null,
      'Either header or title must be provided.');
  var key = GlobalKey<_DialogState>();

  OverlayEntry? dialogOverLay;
  OverlayEntry background =
      _generateBackground(() => key.currentState!.close());

  var dialog = Dialog.alert(
    key: key,
    header: header ??
        Text(
          title!,
          style: TextStyle(fontSize: Dialog.titleFontSize),
        ),
    body: ConditionalWidget(
      condition: body != null,
      ifTrue: body!,
      ifFalse: Text(message!,
          style: TextStyle(
              overflow: TextOverflow.visible,
              fontSize: 12,
              letterSpacing: 0.4)),
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

  Overlay.of(context).insert(background);
  Overlay.of(context).insert(dialogOverLay);
}

/// generates a background overlay for dismissing the dialog
OverlayEntry _generateBackground(Function() dismiss) {
  return OverlayEntry(
    builder: (context) => GestureDetector(
      onTap: dismiss,
      child: Container(
        color: Colors.black38,
      ),
    ),
  );
}
