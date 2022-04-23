part of lbplanner_routes;

/// Themes settings theme item.
class SettingsThemesThemeItem extends StatelessWidget {
  /// Themes settings theme item.
  const SettingsThemesThemeItem({Key? key, required this.theme}) : super(key: key);

  /// The theme to dislplay.
  final NcTheme theme;

  /// The radius of the corners.
  static const double radius = 14;

  /// The size of the icon.
  static const double iconSize = 22;

  /// The width of the border.
  static const double borderWidth = 2;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) => HoverBuilder(builder: (context, hovering) {
              var user = ref.watch(userController);
              var active = theme == NcThemes.current || hovering;

              return AnimatedContainer(
                padding: EdgeInsets.all(NcSpacing.smallSpacing + (active ? 0 : borderWidth)),
                duration: kFastAnimationDuration,
                curve: kAnimationCurve,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  border: Border.all(
                    color: active ? theme.accentColor : theme.primaryColor,
                    width: active ? borderWidth : 0,
                  ),
                  boxShadow: kElevationToShadow[4],
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: LpIcon(
                  theme.icon,
                  size: iconSize,
                  color: theme.iconColor,
                ),
              );
            }));
  }
}
