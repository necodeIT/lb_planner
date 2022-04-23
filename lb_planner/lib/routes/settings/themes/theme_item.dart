part of lbplanner_routes;

/// Themes settings theme item.
class SettingsThemesThemeItem extends StatefulWidget {
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

  /// The size of the item.
  static const double size = 48;

  @override
  State<SettingsThemesThemeItem> createState() => _SettingsThemesThemeItemState();
}

class _SettingsThemesThemeItemState extends State<SettingsThemesThemeItem> {
  Future<RawApiResponse>? _themeFuture;

  _setTheme(UserProvider controller) async {
    if (widget.theme == NcThemes.current) return;

    // throw Exception('Catgirl');

    _themeFuture = null;

    setState(() {
      _themeFuture = controller.updateTheme(widget.theme.name);
      // _themeFuture = Future.delayed(Duration(seconds: 10));
    });

    var response = await _themeFuture!;

    if (response.succeeded) setTheme(widget.theme);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => HoverBuilder(
        onTap: () => _setTheme(ref.read(userController)),
        builder: (context, hovering) {
          var active = widget.theme == NcThemes.current || hovering;

          return AnimatedContainer(
            padding: EdgeInsets.all(active ? 0 : SettingsThemesThemeItem.borderWidth),
            height: SettingsThemesThemeItem.size,
            width: SettingsThemesThemeItem.size,
            duration: kFastAnimationDuration,
            curve: kAnimationCurve,
            decoration: BoxDecoration(
              color: widget.theme.primaryColor,
              border: Border.all(
                color: active ? widget.theme.accentColor : widget.theme.primaryColor,
                width: active ? SettingsThemesThemeItem.borderWidth : 0,
              ),
              boxShadow: kElevationToShadow[4],
              borderRadius: BorderRadius.circular(SettingsThemesThemeItem.radius),
            ),
            child: ConditionalWrapper(
              condition: _themeFuture != null,
              wrapper: (context, child) => FutureBuilder(
                future: _themeFuture,
                builder: (context, snapshot) => ConditionalWidget(
                  condition: snapshot.connectionState == ConnectionState.done,
                  trueWidget: (context) => child,
                  falseWidget: (context) => LpProgressindicator.circular(
                    size: SettingsThemesThemeItem.iconSize,
                    color: widget.theme.accentColor,
                    thickness: 3,
                  ),
                ),
              ),
              child: LpIcon(
                widget.theme.icon,
                size: SettingsThemesThemeItem.iconSize,
                color: widget.theme.iconColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
