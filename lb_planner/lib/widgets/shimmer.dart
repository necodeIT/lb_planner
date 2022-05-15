part of lbplanner_widgets;

/// Themed [Shimmer].
class LpShimmer extends StatelessWidget {
  /// Themed [Shimmer].
  // ignore: no-magic-number
  const LpShimmer({Key? key, this.width, this.height = 30, this.child}) : super(key: key);

  /// The width of the shimmer.
  final double? width;

  /// The height of the shimmer.
  final double? height;

  /// The child of the shimmer.
  ///
  /// If not set the shimmer will be a rounded container.
  final Widget? child;

  /// Default value for [Shimmer.period]
  static const period = Duration(milliseconds: 2000);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: period,
      child: child ??
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(kRadius),
            ),
          ),
      baseColor: secondaryColor,
      // ignore: no-magic-number
      highlightColor: secondaryColor.lighten(0.02),
    );
  }
}
