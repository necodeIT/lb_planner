part of lbplanner_routes;

/// Header for the dropdown sections.
class CalendarPlanDropdownHeader extends StatelessWidget {
  /// Header for the dropdown sections.
  const CalendarPlanDropdownHeader({Key? key, required this.onTap, required this.active, required this.title}) : super(key: key);

  /// Called when the header is tapped.
  final VoidCallback onTap;

  /// Whether the header is active.
  final bool active;

  /// The header text.
  final String title;

  /// The font size of the header.
  static const double fontSize = 17.0;

  /// The thickness of the indicator.
  static const double indicatorThickness = 4.0;

  /// The width if the indicator.
  static const double indicatorWidth = 85.0;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: !active,
      wrapper: (context, child) => GestureDetector(child: child, onTap: onTap),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        NcTitleText(
          title,
          fontSize: fontSize,
        ),
        NcSpacing.xs(),
        Container(
          width: indicatorWidth,
          height: indicatorThickness,
          decoration: BoxDecoration(
            color: active ? accentColor : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(kRadius)),
          ),
        ),
      ]),
    );
  }
}
