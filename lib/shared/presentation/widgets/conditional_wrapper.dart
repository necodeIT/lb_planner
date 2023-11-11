import 'package:flutter/material.dart';

/// Allows you to conditionally wrap a [child] widget with one of two different wrappers based on a specified [condition].
///
/// You can provide a[wrapper] to use when the [condition] is `true` and an optional [falseWrapper] to use when the [condition] is `false`.
/// This is useful for applying conditional styling or functionality to other widgets.
class ConditionalWrapper extends StatelessWidget {
  /// Allows you to conditionally wrap a [child] widget with one of two different wrappers based on a specified [condition].
  ///
  /// You can provide a[wrapper] to use when the [condition] is `true` and an optional [falseWrapper] to use whenthe [condition] is `false`.
  /// This is useful for applying conditional styling or functionality to other widgets.
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
