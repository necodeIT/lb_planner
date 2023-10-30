import 'package:flutter/material.dart';

/// Wraps the given [child] with the given [wrapper] if the given [condition] is true.
/// Also provides an optional [falseWrapper] if the given [condition] is false.
class ConditionalWrapper extends StatelessWidget {
  /// Wraps the given [child] with the given [wrapper] if the given [condition] is true.
  /// Also provides an optional [falseWrapper] if the given [condition] is false.
  const ConditionalWrapper(
      {Key? key,
      required this.condition,
      required this.child,
      required this.wrapper,
      this.falseWrapper})
      : super(key: key);

  /// The condition to check.
  final bool condition;

  /// The child to wrap.
  final Widget child;

  /// The wrapper to use if the condition is true.
  final WrapperBuilder wrapper;

  /// The wrapper to use if the condition is false.
  final WrapperBuilder? falseWrapper;

  @override
  Widget build(BuildContext context) {
    return condition
        ? wrapper(context, child)
        : falseWrapper?.call(context, child) ?? child;
  }
}

/// The builder for [ConditionalWrapper] to wrap the [child].
typedef WrapperBuilder = Widget Function(BuildContext context, Widget child);
