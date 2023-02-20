part of lbplanner_routes;

/// Update route.
class UpdateRoute extends StatefulWidget {
  /// Update route.
  const UpdateRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final RouteInfo info = RouteInfo(
    routeName: "/update",
    builder: (_, __) => UpdateRoute(),
    standalone: true,
  );

  /// The size of the loading indicator.
  static const double loaderSize = 320;

  /// The thickness of the loading indicator.
  static const double loaderThickness = 10;

  /// The font size used for messages
  static const double fontSize = 25;

  @override
  State<UpdateRoute> createState() => _UpdateRouteState();
}

class _UpdateRouteState extends State<UpdateRoute> {
  // @override
  // initState() {
  //   super.initState();

  //   IRefreshable.pauseAll();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var updater = ref.watch(updaterProvider);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: UpdateRoute.loaderSize,
              height: UpdateRoute.loaderSize,
              child: Stack(
                children: [
                  if (updater.status.isIdle || updater.status.isDownloading) Center(child: LpLogo()),
                  if (updater.status.isDone || updater.status.isDownloading)
                    LpLoadingIndicator.circular(
                      size: UpdateRoute.loaderSize,
                      thickness: UpdateRoute.loaderThickness,
                      // ignore: no-magic-number
                      progress: updater.status.isDone ? null : updater.progress / 100,
                    ),
                  if (updater.status.isDone)
                    Center(
                      child: NcCaptionText(
                        t.update_launching,
                        fontSize: UpdateRoute.fontSize,
                      ),
                    ),
                ],
              ),
            ),
            if (updater.status.isIdle)
              SizedBox(
                width: UpdateRoute.loaderSize,
                child: LpButton(
                  text: t.update_btn(updater.latestVersionName),
                  // TODO: onPressed: () => updater.upgrade(() {}),
                  onPressed: () {
                    var userTheme = NcThemes.current.name == sakuraTheme.name ? "sakura" : NcThemes.current.name.toLowerCase();

                    var urlToLaunch = 'https://projekte.tgm.ac.at/lb-planner/docs/?theme=$userTheme&section=0&heading=2';
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
