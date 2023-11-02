import 'package:flutter/material.dart';

/// Base class for all [HoverableWidget]s.
abstract class HoverableWidget extends StatefulWidget {
  /// Base class for all [HoverableWidget]s.
  const HoverableWidget({Key? key, required this.cursor, required this.onTap})
      : super(key: key);

  /// The cursor to use when the widget is hovered.
  final MouseCursor cursor;

  /// Override this method to build the widget based if the user [isHovering] or not.
  Widget build(BuildContext context, bool isHovering);

  /// Called when the user taps the widget.
  final VoidCallback? onTap;

  @override
  State<HoverableWidget> createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  bool _isHovering = false;

  _onEnter(_) {
    setState(() {
      _isHovering = true;
    });
  }

  _onExit(_) {
    setState(() {
      _isHovering = false;
    });
  }

  bool get isHovering => _isHovering;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: widget.cursor,
        onEnter: _onEnter,
        onExit: _onExit,
        child: widget.build(context, _isHovering),
      ),
    );
  }
}

/// The default cursor used when hovering over a widget.
const kDefaultHoverCursor = SystemMouseCursors.click;
