part of lbplanner_routes;

/// Wraps the given route inside a title and displays the user profile.
class RouteTitle extends StatelessWidget {
  /// Wraps the given route inside a title and displays the user profile.
  const RouteTitle({Key? key, required this.child}) : super(key: key);

  /// The route to display.
  final Widget child;

  /// Builder for convinience.
  static Widget builder(BuildContext context, Widget child) => RouteTitle(child: child);

  /// The font size of the title.
  static const double titleSize = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NcSpacing.medium(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConditionalWrapper(
              condition: currentRoute.parent != null,
              wrapper: (context, child) => LpGestureDetector(
                onTap: () => currentRoute.parent!.push(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LpIcon(Feather.arrow_left_circle, size: titleSize),
                    NcSpacing.small(),
                    child,
                  ],
                ),
              ),
              child: NcTitleText(
                currentRoute.title(context),
                fontSize: titleSize,
              ),
            ),
            UserProfile(),
          ],
        ),
        NcSpacing.small(),
        Expanded(child: child),
        NcSpacing.medium(),
      ],
    );
  }
}
