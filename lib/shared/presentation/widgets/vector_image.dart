import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lb_planner/shared/shared.dart';

/// Enables theming of vector graphics.
///
/// Usage:
/// - [VectorImage.primaryColor] &rarr; Interpolate this into the SVG code to use the primary color of the [this.current] theme.
/// - [VectorImage.secondaryColor] &rarr; Interpolate this into the SVG code to use the secondary color of the theme.
/// - [VectorImage.tertiaryColor] &rarr; Interpolate this into the SVG code to use the tertiary color of the theme.
/// - [VectorImage.accentColor] &rarr; Interpolate this into the SVG code to use the accent color of the theme.
/// - [VectorImage.textColor] &rarr; Interpolate this into the SVG code to use the text color of the  theme.

class VectorImage extends StatelessWidget {
  /// Takes the given SVG [asset] and interpolates the current theme colors into it.
  const VectorImage(this.asset,
      {Key? key, this.width, this.height, this.alignment = Alignment.center})
      : super(key: key);

  /// The path to the image.
  final String asset;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The alignment of the image.
  final Alignment alignment;

  /// Interpolate this into the SVG code to use the accent color of the current theme.
  static const accentColor = "{accentcolor}";

  /// Interpolate this into the SVG code to use the text color of the current theme.
  static const textColor = "{textcolor}";

  /// Interpolate this into the SVG code to use the secondary color of the current theme.
  static const secondaryColor = "{secondarycolor}";

  /// Interpolate this into the SVG code to use the primary color of the current theme.
  static const primaryColor = "{primarycolor}";

  /// Interpolate this into the SVG code to use the tertiary color of the current theme.
  static const tertiaryColor = "{tertiarycolor}";

  /// Interpolates all the theme colors into the given [code].
  static String svg(String code, BuildContext context) {
    var encoded =
        code.replaceAll(accentColor, _toHex(context.theme.colorScheme.primary));
    encoded = encoded.replaceAll(
        textColor, _toHex(context.theme.textTheme.bodyLarge!.color!));
    encoded = encoded.replaceAll(
        secondaryColor, _toHex(context.theme.colorScheme.background));
    encoded = encoded.replaceAll(
        primaryColor, _toHex(context.theme.colorScheme.surface));
    encoded =
        encoded.replaceAll(tertiaryColor, _toHex(context.theme.dividerColor));

    return encoded;
  }

  /// Converts the given [color] to a hex string..
  static String _toHex(Color color) =>
      "#${color.value.toRadixString(16).substring(2)}";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(asset),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            child: Center(
              child: Icon(
                Icons.error,
                color: context.theme.colorScheme.error,
              ),
            ),
            width: width,
            height: height,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            child: Center(
              child: const CircularProgressIndicator(),
            ),
            width: width,
            height: height,
          );
        }
        return SvgPicture.string(
          svg(snapshot.data!, context),
          width: width,
          height: height,
          alignment: alignment,
        );
      },
    );
  }
}
