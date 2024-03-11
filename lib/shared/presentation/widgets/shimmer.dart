import 'package:flutter/material.dart';
import 'package:lb_planner/shared/presentation/widgets/color_utils.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  // ignore: no-magic-number
  const ShimmerEffect({Key? key, this.width, this.height = 30, this.child})
      : super(key: key);

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
              color: context.theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
      baseColor: context.theme.colorScheme.secondary,
      // ignore: no-magic-number
      highlightColor: context.theme.colorScheme.secondary.lighten(0.02),
    );
  }
}
