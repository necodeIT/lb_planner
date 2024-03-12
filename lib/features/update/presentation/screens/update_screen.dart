import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/update/update.dart';

/// Renders an update screen, which allows the user to update the app.

@RoutePage()
class UpdateScreen extends ConsumerStatefulWidget with SidebarWrapperMixin {
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
  void showInstructions() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAlertDialog(
        context,
        title: t.update_dialog_title,
        message: t.update_dialog_noAutoUpdate,
        body: SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ref.read(patchingProgressController).canPatch
                    ? t.update_dialog_helpNeeded
                    : t.update_dialog_noAutoUpdate,
                overflow: TextOverflow.visible,
              ),
              Spacing.large(),
              Expanded(
                child: MarkdownView(
                  ref.read(patchingProgressController).getInstructions(context),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final progressController = ref.watch(patchingProgressController);
    final patchingProgress = ref.watch(patchingProgressProvider);

    if (patchingProgress.isLoading) {
      return Container(
        color: context.theme.colorScheme.background,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Material(
      child: Container(
        color: context.theme.colorScheme.background,
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
                    if (patchingProgress.hasValue)
                      Text(
                        t.update_patchNotes(progressController.target.name),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                if (patchingProgress.hasError)
                  ElevatedButton(
                    onPressed: progressController.patch,
                    child: Text(t.update_btnErr),
                  ),
                if (patchingProgress.hasValue && patchingProgress.value != null)
                  Row(
                    children: [
                      Text(
                        t.update_downloading(
                            patchingProgress.value!.round() * 100),
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Spacing.small(),
                      CircularProgressIndicator(),
                    ],
                  ),
                if (patchingProgress.hasValue && patchingProgress.value != null)
                  Text(
                    t.update_installing,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                if (!progressController.canPatch)
                  ElevatedButton(
                      onPressed: showInstructions,
                      child: Text(t.update_btnInstall)),
              ],
            ),
            Spacing.large(),
            if (patchingProgress.hasValue)
              Expanded(
                child: MarkdownView(progressController.target.changelog),
              ),
          ],
        ),
      ),
    );
  }
}
