part of lbplanner_routes;

/// Route displayed when the user is offline.
class OfflineRoute extends LocalizedWidget {
  /// Route displayed when the user is offline.
  const OfflineRoute({Key? key}) : super(key: key);

  /// The name of the route.
  static const String routeName = '/offline';

  /// The size of the icon.
  static const double iconSize = 100;

  /// The size of the title text.
  static const double titleSize = 35;

  ///
  /// The size of the caption text.
  static const double captionSize = 20;

  @override
  Widget build(BuildContext context, t) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LpIcon(
            Icons.wifi_off_outlined,
            size: iconSize,
            color: accentColor,
          ),
          NcSpacing.large(),
          NcTitleText(
            t.offline_title,
            color: accentColor,
            fontSize: titleSize,
          ),
          NcSpacing.xl(),
          NcCaptionText(
            t.offline_caption,
            fontSize: captionSize,
          ),
        ],
      ),
    );
  }
}
