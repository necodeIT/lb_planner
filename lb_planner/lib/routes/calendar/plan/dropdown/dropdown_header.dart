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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      return ConditionalWrapper(
        condition: !active,
        wrapper: (context, child) => GestureDetector(child: child, onTap: onTap),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          NcTitleText(
            title,
            fontSize: 17,
          ),
          NcSpacing.xs(),
          Container(
            width: box.maxWidth * .5,
            height: 4,
            decoration: BoxDecoration(
              color: active ? accentColor : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(kRadius)),
            ),
          ),
        ]),
      );
    });
  }
}
