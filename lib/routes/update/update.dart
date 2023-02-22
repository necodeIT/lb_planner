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
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var updater = ref.watch(updateController);
        var update = ref.watch(updateProvider);

        if (update.command.isNotEmpty) {
          lpShowAlertDialog(
            context,
            title: t.update_dialog_title,
            body: Column(
              children: [
                NcBodyText(kSetupType.canAutoUpdate ? t.update_dialog_helpNeeded : t.update_dialog_noAutoUpdate),
                NcSpacing.large(),
                LpTextField.filled(
                  controller: TextEditingController(text: update.command),
                  readOnly: true,
                  suffix: IconButton(
                    color: accentColor,
                    onPressed: () => Clipboard.setData(ClipboardData(text: update.command)),
                    icon: LpIcon(Icons.copy),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    NcVectorImage(code: kAppIcon),
                    NcSpacing.small(),
                    NcBodyText(update.latestVersionName),
                  ],
                ),
                if (update.downloadStatus == DownloadStatus.idle)
                  LpButton(
                    onPressed: updater.upgrade,
                    child: NcBodyText(t.update_btn),
                  ),
                if (update.downloadStatus == DownloadStatus.downlaoding)
                  NcBodyText(
                    t.update_downloading(update.fileName, update.progress),
                  ),
              ],
            ),
            NcSpacing.large(),
            Expanded(
              child: SingleChildScrollView(
                child: Markdown(
                  data: update.patchNotes,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
