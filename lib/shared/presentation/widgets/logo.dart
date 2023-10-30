import 'package:flutter/material.dart';
import 'vector_image.dart';

/// Svg logo of the app.
class Logo extends StatelessWidget {
  /// Svg logo of the app.
  const Logo({Key? key, this.size, this.alignment = Alignment.center})
      : super(key: key);

  /// The size of the logo.
  final double? size;

  /// The alignment of the logo.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return VectorImage(
      'assets/logo.svg',
      height: size,
      width: size,
      alignment: alignment,
    );
  }
}
