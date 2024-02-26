import 'package:flutter/material.dart';
import 'spacing.dart';

/// Tag widget for courses.
class LpTag extends StatelessWidget {
  /// Tag widget for courses.
  const LpTag(
      {Key? key,
      required this.text,
      required this.color,
      this.fontSize = defaultFontsize})
      : super(key: key);

  /// The text to display in the tag.
  final String text;

  /// The color of the tag.
  final Color color;

  /// The font size of the [text].
  final double fontSize;

  /// The default [fontSize].
  static const double defaultFontsize = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.xsSpacing, vertical: Spacing.xsSpacing),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
