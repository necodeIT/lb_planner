import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Offsets the child to the given [offset] when hovered.
class OffsetOnHover extends HoverableWidget {
  /// Offsets the given [child] to the given [offset] when hovered.
  const OffsetOnHover({
    Key? key,
    required this.duration,
    this.curve = Curves.linear,
    this.alignment = Alignment.center,
    required this.offset,
    required this.child,
    MouseCursor cursor = kDefaultHoverCursor,
    VoidCallback? onTap,
  }) : super(key: key, cursor: cursor, onTap: onTap);

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation.
  final Curve curve;

  /// The offset of the child when hovered.
  final Offset offset;

  /// The child to offset.
  final Widget child;

  /// The alignment of the child.
  final Alignment alignment;

  @override
  Widget build(BuildContext context, bool isHovering) {
    var transform = Matrix4.identity()..translate(offset.dx, offset.dy);

    return TransformOnHover(
      duration: duration,
      curve: curve,
      alignment: alignment,
      transform: isHovering ? transform : Matrix4.identity(),
      child: child,
    );
  }
}
