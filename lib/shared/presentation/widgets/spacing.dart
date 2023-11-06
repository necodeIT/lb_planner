import 'package:flutter/cupertino.dart';

/// This widget allows you to add spacing or padding in both the vertical
/// and horizontal directions, or separately in either the vertical or horizontal
/// direction.

class Spacing extends StatelessWidget {
  /// This widget allows you to add spacing or padding in both the vertical
  /// and horizontal directions, or separately in either the vertical or horizontal
  /// direction.
  const Spacing({
    Key? key,
    this.vertical = 0.0,
    this.horizontal = 0.0,
  }) : super(key: key);

  // Constructors for predefined spacing values

  // Both vertical and horizontal
  Spacing.xs({Key? key})
      : this(key: key, vertical: xsSpacing, horizontal: xsSpacing);
  Spacing.small({Key? key})
      : this(key: key, vertical: smallSpacing, horizontal: smallSpacing);
  Spacing.medium({Key? key})
      : this(key: key, vertical: mediumSpacing, horizontal: mediumSpacing);
  Spacing.large({Key? key})
      : this(key: key, vertical: largeSpacing, horizontal: largeSpacing);
  Spacing.xl({Key? key})
      : this(key: key, vertical: xlSpacing, horizontal: xlSpacing);

  // Vertical spacing
  Spacing.xsVertical({Key? key}) : this(key: key, vertical: xsSpacing);
  Spacing.smallVertical({Key? key}) : this(key: key, vertical: smallSpacing);
  Spacing.mediumVertical({Key? key}) : this(key: key, vertical: mediumSpacing);
  Spacing.largeVertical({Key? key}) : this(key: key, vertical: largeSpacing);
  Spacing.xlVertical({Key? key}) : this(key: key, vertical: xlSpacing);

  // Horizontal spacing
  Spacing.xsHorizontal({Key? key}) : this(key: key, horizontal: xsSpacing);
  Spacing.smallHorizontal({Key? key})
      : this(key: key, horizontal: smallSpacing);
  Spacing.mediumHorizontal({Key? key})
      : this(key: key, horizontal: mediumSpacing);
  Spacing.largeHorizontal({Key? key})
      : this(key: key, horizontal: largeSpacing);
  Spacing.xlHorizontal({Key? key}) : this(key: key, horizontal: xlSpacing);

  /// Value for extra small spacing.
  static const double xsSpacing = 5;

  /// Value for small spacing.
  static const double smallSpacing = 10;

  /// Value for medium spacing.
  static const double mediumSpacing = 20;

  /// Value for large spacing.
  static const double largeSpacing = 25;

  /// Value for extra large spacing.
  static const double xlSpacing = 30;

  /// Value for vertical spacing.
  final double vertical;

  /// Value for horizontal spacing.
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: horizontal, height: vertical);
  }
}
