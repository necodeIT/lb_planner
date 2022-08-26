part of lbplanner_widgets;

/// Themed [Card]
class LpCard extends StatelessWidget {
  /// Themed [Card]
  const LpCard({Key? key, required this.child, this.elevation = defaultElevation}) : super(key: key);

  /// The child of the card.
  final Widget child;

  /// The elevation of the card.
  final double elevation;

  /// The devault elevation of the card.
  static const double defaultElevation = 4;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(NcSpacing.smallSpacing),
        child: child,
      ),
    );
  }
}
