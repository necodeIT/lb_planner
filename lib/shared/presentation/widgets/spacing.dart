
import 'package:flutter/cupertino.dart';

/// Predefined spacings.
///
/// Spacing is horizontally and vertically.
class Spacing extends StatelessWidget {
  /// Extra small spacing. Uses [Spacing.xsSpacing].
  Spacing.xs({Key? key}) : super(key: key) {
    spacing = xsSpacing;
  }

  /// Small spacing. Uses [Spacing.smallSpacing].
  Spacing.small({Key? key}) : super(key: key) {
    spacing = smallSpacing;
  }

  /// Medium spacing. Uses [Spacing.mediumSpacing].
  Spacing.medium({Key? key}) : super(key: key) {
    spacing = mediumSpacing;
  }

  /// Large spacing. Uses [Spacing.largeSpacing].
  Spacing.large({Key? key}) : super(key: key) {
    spacing = largeSpacing;
  }

  /// Extra large spacing. Uses [Spacing.xlSpacing].
  Spacing.xl({Key? key}) : super(key: key) {
    spacing = xlSpacing;
  }

  /// Value for extra small spacing. Used in [NcSpacing.xs].
  static const double xsSpacing = 5;

  /// Value for small spacing. Used in [NcSpacing.small].
  static const double smallSpacing = 10;

  /// Value for medium spacing. Used in [NcSpacing.medium].
  static const double mediumSpacing = 20;

  /// Value for large spacing. Used in [NcSpacing.large].
  static const double largeSpacing = 25;

  /// Value for extra large spacing. Used in [NcSpacing.xl].
  static const double xlSpacing = 30;

  /// The spacing value used.
  /// One of the following values: [Spacing.xsSpacing], [Spacing.smallSpacing], [Spacing.mediumSpacing], [Spacing.largeSpacing], [Spacing.xlSpacing].
  late final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spacing, height: spacing);
  }
}