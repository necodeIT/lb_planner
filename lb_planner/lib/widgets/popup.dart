part of lbplanner_widgets;

/// Wrapper that inserts the given [popupBuilder] into the stack.
class LpPopup extends StatefulWidget {
  /// Wrapper that inserts the given [popupBuilder] into the stack.
  const LpPopup({
    Key? key,
    required this.popupBuilder,
    required this.child,
    this.backgroundDismissable = true,
    this.animationDuration = kSlowAnimationDuration,
    this.animationCurve = kAnimationCurve,
    this.backgroundColor = Colors.transparent,
    this.offset = Offset.zero,
  }) : super(key: key);

  /// Builds the popup to insert.
  final PopupBuilder popupBuilder;

  /// The offset of the popup.
  final Offset offset;

  /// The child to wrap.
  final Widget child;

  /// The duration of the popup animation.
  final Duration animationDuration;

  /// The curve of the popup animation.
  final Curve animationCurve;

  /// Whether the popup can be dismissed by tapping the background.
  final bool backgroundDismissable;

  /// The background color of the popup.
  final Color backgroundColor;

  @override
  State<LpPopup> createState() => _LpPopupState();
}

class _LpPopupState extends State<LpPopup> {
  OverlayEntry? _popup;
  OverlayEntry? _dissmissArea;
  final GlobalKey _key = GlobalKey();

  void close() {
    _popup?.remove();
    _popup = null;

    _dissmissArea?.remove();
    _dissmissArea = null;
  }

  void show(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    _popup = OverlayEntry(
      builder: (context) {
        RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);

        return _PopupAnimator(
          triggerHeight: box.size.height,
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          right: screen.width - position.dx - box.size.width + widget.offset.dx,
          top: position.dy + widget.offset.dy,
          child: widget.popupBuilder(context, close),
        );
      },
    );

    if (widget.backgroundDismissable) {
      _dissmissArea = OverlayEntry(
        builder: (context) => GestureDetector(
          onTap: close,
          child: Container(
            color: widget.backgroundColor,
            width: screen.width,
            height: screen.height,
          ),
        ),
      );

      Overlay.of(context)!.insert(_dissmissArea!);
    }

    Overlay.of(context)!.insert(_popup!);
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      key: _key,
      onPointerDown: (event) => show(context),
      child: widget.child,
    );
  }
}

class _PopupAnimator extends StatefulWidget {
  const _PopupAnimator({Key? key, required this.child, required this.duration, required this.curve, required this.right, required this.top, required this.triggerHeight}) : super(key: key);

  final Widget child;

  final Duration duration;

  final Curve curve;

  final double right;

  final double top;

  final double triggerHeight;

  @override
  State<_PopupAnimator> createState() => __PopupAnimatorState();
}

class __PopupAnimatorState extends State<_PopupAnimator> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      _controller = AnimationController(duration: widget.duration, vsync: this);
      _controller!.forward();
    }

    return AnimatedBuilder(
      animation: _controller!,
      child: widget.child,
      builder: (context, child) {
        var value = Tween(begin: (widget.top - widget.triggerHeight) / widget.top, end: 1.0).animate(CurvedAnimation(parent: _controller!, curve: widget.curve)).value;

        return Positioned(
          right: widget.right,
          top: widget.top * value,
          child: Material(child: child!),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

/// Builds the popup to insert.
typedef PopupBuilder = Widget Function(BuildContext context, VoidCallback close);
