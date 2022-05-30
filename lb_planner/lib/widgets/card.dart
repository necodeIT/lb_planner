part of lbplanner_widgets;

/// Themed [Card]
class LpCard extends StatelessWidget {
  /// Themed [Card]
  const LpCard({Key? key, required this.child}) : super(key: key);

  /// The child of the card.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(NcSpacing.smallSpacing),
        child: child,
      ),
    );
  }
}
