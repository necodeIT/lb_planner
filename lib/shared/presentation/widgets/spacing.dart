import 'package:flutter/cupertino.dart';

/// Allows you to add spacing or padding in both the vertical and horizontal directions,
/// or separately in either the vertical or horizontal direction.
class Spacing extends StatelessWidget {
  /// Allows you to add spacing or padding in both the vertical and horizontal directions,
  /// or separately in either the vertical or horizontal direction.
  const Spacing._({
    Key? key,
    this.vertical = 0.0,
    this.horizontal = 0.0,
  }) : super(key: key);

  /// Both vertical and horizontal [xsSpacing]
  const Spacing.xs({Key? key})
      : this._(key: key, vertical: xsSpacing, horizontal: xsSpacing);

  /// Both vertical and horizontal [smallSpacing]
  const Spacing.small({Key? key})
      : this._(key: key, vertical: smallSpacing, horizontal: smallSpacing);

  /// Both vertical and horizontal [mediumSpacing]
  const Spacing.medium({Key? key})
      : this._(key: key, vertical: mediumSpacing, horizontal: mediumSpacing);

  /// Both vertical and horizontal [largeSpacing]
  const Spacing.large({Key? key})
      : this._(key: key, vertical: largeSpacing, horizontal: largeSpacing);

  /// Both vertical and horizontal [xlSpacing]
  const Spacing.xl({Key? key})
      : this._(key: key, vertical: xlSpacing, horizontal: xlSpacing);

  /// Vertical [xsSpacing]
  const Spacing.xsVertical({Key? key}) : this._(key: key, vertical: xsSpacing);

  /// Vertical [smallSpacing]
  const Spacing.smallVertical({Key? key})
      : this._(key: key, vertical: smallSpacing);

  /// Vertical [mediumSpacing]
  const Spacing.mediumVertical({Key? key})
      : this._(key: key, vertical: mediumSpacing);

  /// Vertical [largeSpacing]
  const Spacing.largeVertical({Key? key})
      : this._(key: key, vertical: largeSpacing);

  /// Vertical [xlSpacing]
  const Spacing.xlVertical({Key? key}) : this._(key: key, vertical: xlSpacing);

  /// Horizontal [xsSpacing]
  const Spacing.xsHorizontal({Key? key})
      : this._(key: key, horizontal: xsSpacing);

  /// Horizontal [smallSpacing]
  const Spacing.smallHorizontal({Key? key})
      : this._(key: key, horizontal: smallSpacing);

  /// Horizontal [mediumSpacing]
  const Spacing.mediumHorizontal({Key? key})
      : this._(key: key, horizontal: mediumSpacing);

  /// Horizontal [largeSpacing]
  const Spacing.largeHorizontal({Key? key})
      : this._(key: key, horizontal: largeSpacing);

  /// Horizontal [xlSpacing]
  const Spacing.xlHorizontal({Key? key})
      : this._(key: key, horizontal: xlSpacing);

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
