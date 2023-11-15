import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/update/update.dart';

/// Renders an update screen, which allows the user to update the app.

@RoutePage()
class UpdateScreen extends ConsumerStatefulWidget {
  /// Renders an update screen, which allows the user to update the app.
  const UpdateScreen({Key? key}) : super(key: key);

  /// Factor multiplied by the screen width to get the padding.
  static const paddingFactor = 0.1;

  /// Size of the app icon.
  static const double iconSize = 60;

  @override
  ConsumerState<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends ConsumerState<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final progressController = ref.watch(patchingProgressController);
        final patchingProgress = ref.watch(patchingProgressProvider);
        final updateChecker = ref.watch(updateCheckerProvider);

        void showCommand() {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAlertDialog(
              context,
              title: t.update_dialog_title,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    progressController.canPatch
                        ? t.update_dialog_helpNeeded
                        : t.update_dialog_noAutoUpdate,
                    overflow: TextOverflow.visible,
                  ),
                  Spacing.large(),
                  Snippet(code: progressController.getInstructions(context)),
                ],
              ),
            );
          });
        }

        if (progressController.getInstructions(context).isNotEmpty) {
          showCommand();
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
                      Text(
                        t.update_patchNotes(progressController.latest.name),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (patchingProgress?.error != null)
                    ElevatedButton(
                      onPressed: progressController.patch,
                      child: Text(t.update_btnErr),
                    ),
                  if (patchingProgress != null)
                    Row(
                      children: [
                        Text(
                          t.update_downloading(
                              patchingProgress.progress.round()),
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        Spacing.small(),
                        CircularProgressIndicator(),
                      ],
                    ),
                  if (patchingProgress != null &&
                      progressController.getInstructions(context).isEmpty)
                    Text(
                      t.update_installing,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  if (patchingProgress != null &&
                      progressController.getInstructions(context).isNotEmpty)
                    ElevatedButton(
                        onPressed: showCommand,
                        child: Text(t.update_btnInstall)),
                ],
              ),
              Spacing.large(),
              Expanded(
                child: MarkdownView(progressController.latest.changelog),
              ),
            ],
          ),
        );
      },
    );
  }
}
