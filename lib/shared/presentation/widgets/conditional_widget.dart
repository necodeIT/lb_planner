import 'package:flutter/material.dart';

/// Use this to conditionally swap between widgets.
class ConditionalWidget extends StatelessWidget {
  /// Constructs a new [ConditionalWidget] with the given [condition], [ifTrue] and [ifFalse].
  /// If [condition] is true, [ifTrue] will be used.
  /// If [condition] is false, [ifFalse] will be used.
  const ConditionalWidget(
      {Key? key,
      required this.condition,
      required this.ifTrue,
      required this.ifFalse})
      : super(key: key);

  /// The condition to check.
  final bool condition;

  /// The widget to show if the condition is true.
  final Widget ifTrue;

  /// The widget to show if the condition is false.
  final Widget ifFalse;

  @override
  Widget build(BuildContext context) => condition ? ifTrue : ifFalse;
}
