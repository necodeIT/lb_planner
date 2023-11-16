import 'package:flutter/material.dart';
import 'vector_image.dart';

/// Displays the application's logo.
///
/// You can customize the [size] and [alignment] of the logo within the widget.
class Logo extends StatelessWidget {
  /// Displays the application's logo.
  ///
  /// You can customize the [size] and [alignment] of the logo within the widget.
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
