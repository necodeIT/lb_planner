import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/update/update.dart';

/// Update route.

@RoutePage()
class UpdateScreen extends StatefulWidget {
  /// Update route.
  const UpdateScreen({Key? key}) : super(key: key);

  /// Factor multiplied by the screen width to get the padding.
  static const paddingFactor = 0.1;

  /// Size of the app icon.
  static const double iconSize = 60;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        //var updater = ref.watch(updateController);
        //var update = ref.watch(updateProvider);
        final patchingProgressController = patchingProgressProvider.notifier;

        final isUpdateAvailableProvider =
            AsyncNotifierProvider<IsUpdateAvailableProviderState, bool>(
          () => IsUpdateAvailableProviderState(),
        );

        void showCommand() {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAlertDialog(
              context,
              title: t.update_dialog_title,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NcBodyText(
                    kSetupType.canAutoUpdate
                        ? t.update_dialog_helpNeeded
                        : t.update_dialog_noAutoUpdate,
                    overflow: TextOverflow.visible,
                  ),
                  Spacing.large(),
                  Snippet(code: update.command),
                ],
              ),
            );
          });
        }

        if (update.command.isNotEmpty) {
          showCommand();
        }

        if (update.downloadStatus == DownloadStatus.error) {
          Catcher.reportCheckedError(
              kUpdateErrorKeyword + update.error, StackTrace.current);
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * UpdateScreen.paddingFactor,
            vertical:
                MediaQuery.of(context).size.height * UpdateScreen.paddingFactor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      VectorImage('assets/svg/app_icon.svg',
                          height: UpdateScreen.iconSize),
                      Spacing.small(),
                      NcTitleText(
                        t.update_patchNotes(update.latestVersionName),
                        fontSize: RouteTitle.titleSize,
                      ),
                    ],
                  ),
                  if (update.downloadStatus == DownloadStatus.idle)
                    Button(
                      onPressed: updater.upgrade,
                      text: t.update_btn,
                    ),
                  if (update.downloadStatus == DownloadStatus.error)
                    Button(
                      onPressed: updater.upgrade,
                      text: t.update_btnErr,
                    ),
                  if (update.downloadStatus == DownloadStatus.downlaoding)
                    Row(
                      children: [
                        NcBodyText(
                          t.update_downloading(
                              update.fileName, update.progress),
                        ),
                        Spacing.small(),
                        CircularProgressIndicator(),
                      ],
                    ),
                  if (update.downloadStatus == DownloadStatus.installing &&
                      update.command.isEmpty)
                    NcBodyText(t.update_installing),
                  if (update.downloadStatus == DownloadStatus.installing &&
                      update.command.isNotEmpty)
                    LpButton(onPressed: showCommand, text: t.update_btnInstall),
                ],
              ),
              Spacing.large(),
              Expanded(
                child: MarkdownView(update.patchNotes),
              ),
            ],
          ),
        );
      },
    );
  }
}
