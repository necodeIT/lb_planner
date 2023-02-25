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

  /// Factor multiplied by the screen width to get the padding.
  static const paddingFactor = 0.1;

  /// Size of the app icon.
  static const double iconSize = 60;

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

        void showCommand() {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            lpShowAlertDialog(
              context,
              title: t.update_dialog_title,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NcBodyText(
                    kSetupType.canAutoUpdate ? t.update_dialog_helpNeeded : t.update_dialog_noAutoUpdate,
                    overflow: TextOverflow.visible,
                  ),
                  NcSpacing.large(),
                  LpSnippet(code: update.command),
                ],
              ),
            );
          });
        }

        if (update.command.isNotEmpty) {
          showCommand();
        }

        if (update.downloadStatus == DownloadStatus.error) {
          Catcher.reportCheckedError(kUpdateErrorKeyword + update.error, StackTrace.current);
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * UpdateRoute.paddingFactor,
            vertical: MediaQuery.of(context).size.height * UpdateRoute.paddingFactor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      NcVectorImage(code: kAppIcon, height: UpdateRoute.iconSize),
                      NcSpacing.small(),
                      NcTitleText(
                        t.update_patchNotes(update.latestVersionName),
                        fontSize: RouteTitle.titleSize,
                      ),
                    ],
                  ),
                  if (update.downloadStatus == DownloadStatus.idle)
                    LpButton(
                      onPressed: updater.upgrade,
                      text: t.update_btn,
                    ),
                  if (update.downloadStatus == DownloadStatus.error)
                    LpButton(
                      onPressed: updater.upgrade,
                      text: t.update_btnErr,
                    ),
                  if (update.downloadStatus == DownloadStatus.downlaoding)
                    Row(
                      children: [
                        NcBodyText(
                          t.update_downloading(update.fileName, update.progress),
                        ),
                        NcSpacing.small(),
                        LpLoadingIndicator.circular(),
                      ],
                    ),
                  if (update.downloadStatus == DownloadStatus.installing && update.command.isEmpty) NcBodyText(t.update_installing),
                  if (update.downloadStatus == DownloadStatus.installing && update.command.isNotEmpty) LpButton(onPressed: showCommand, text: t.update_btnInstall),
                ],
              ),
              NcSpacing.large(),
              Expanded(
                child: LpMarkdown(update.patchNotes),
              ),
            ],
          ),
        );
      },
    );
  }
}
