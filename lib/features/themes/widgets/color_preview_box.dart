import 'package:flutter/material.dart';

/// Displays a color preview box with the color name and the color itself.
class ColorPreviewBox extends StatelessWidget {
  /// Displays a color preview box with the color name and the color itself.
  const ColorPreviewBox(
      {super.key, required this.colorName, required this.color});

  /// The color to display.
  final String colorName;

  /// The name of the color.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              boxShadow: kElevationToShadow[1],
            ),
          ),
          const SizedBox(height: 8),
          Text(colorName, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
