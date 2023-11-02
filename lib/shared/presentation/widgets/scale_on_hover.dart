import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Scales the child to the given [scale] when hovered.
class ScaleOnHover extends HoverableWidget {
  /// Scales the given [child] to the given [scale] when hovered.
  const ScaleOnHover({
    Key? key,
    required this.duration,
    this.curve = Curves.linear,
    this.alignment = Alignment.center,
    required this.scale,
    required this.child,
    MouseCursor cursor = kDefaultHoverCursor,
    VoidCallback? onTap,
  }) : super(key: key, cursor: cursor, onTap: onTap);

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation.
  final Curve curve;

  /// The scale of the child when hovered.
  final double scale;

  /// The child to scale.
  final Widget child;

  /// The alignment of the child.
  final Alignment alignment;

  @override
  Widget build(BuildContext context, bool isHovering) {
    return AnimatedScale(
      duration: duration,
      curve: curve,
      alignment: alignment,
      scale: isHovering ? scale : 1.0,
      child: child,
    );
  }
}
