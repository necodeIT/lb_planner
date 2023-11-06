import 'package:flutter/material.dart';
import 'vector_image.dart';

/// This widget is used to display the application's logo, which is loaded
/// from an SVG file. You can customize the size and alignment of the logo within
/// the widget.
class Logo extends StatelessWidget {
  /// This widget is used to display the application's logo, which is loaded
  /// from an SVG file. You can customize the size and alignment of the logo within
  /// the widget.
  const Logo({Key? key, this.size, this.alignment = Alignment.center})
      : super(key: key);

  /// The size of the logo.
  final double? size;

  /// The alignment of the logo.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return VectorImage(
      'assets/svg/logo.svg',
      height: size,
      width: size,
      alignment: alignment,
    );
  }
}
