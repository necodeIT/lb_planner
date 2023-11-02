import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// A builder to adapt to the widget being hoverd or not.
class HoverBuilder extends HoverableWidget {
  /// A builder to adapt to the widget being hoverd or not.
  const HoverBuilder(
      {Key? key,
      required this.builder,
      MouseCursor cursor = kDefaultHoverCursor,
      VoidCallback? onTap})
      : super(key: key, cursor: cursor, onTap: onTap);

  /// The builder to build the widget based if the user is hovering over it or not.
  final Widget Function(BuildContext context, bool isHovering) builder;

  @override
  Widget build(BuildContext context, bool isHovering) =>
      builder(context, isHovering);
}
