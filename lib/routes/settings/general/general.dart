part of lbplanner_routes;

/// The general settings sections of the settings page.
class SettingsGeneral extends StatefulWidget {
  /// The general settings sections of the settings page.
  const SettingsGeneral({Key? key}) : super(key: key);

  @override
  State<SettingsGeneral> createState() => _SettingsGeneralState();
}

class _SettingsGeneralState extends State<SettingsGeneral> {
  Future? _checkUpdatesFuture;
  Future? _clearCacheFuture;
  Future? _deleteProfileFuture;
  // Future? _displayTaskCountFuture;

  // void _displayTaskCount(bool value, WidgetRef ref) async {
  //   if (_displayTaskCountFuture != null) return;

  //   var user = ref.read(userController);

  //   setState(() {
  //     _displayTaskCountFuture = user.updateDisplayTaskCount(value);
  //   });

  //   await _displayTaskCountFuture;

  //   if (!mounted) return;

  //   setState(() {
  //     _displayTaskCountFuture = null;
  //   });
  // }

  void _checkUpdates(WidgetRef ref) async {
    if (_checkUpdatesFuture != null) return;

    var updater = ref.read(updateController);

    setState(() {
      _checkUpdatesFuture = updater.checkForUpdates();
    });

    await _checkUpdatesFuture;

    if (!mounted) return;

    setState(() {
      _checkUpdatesFuture = null;
    });
  }

  void _clearCache() async {
    if (_clearCacheFuture != null) return;

    setState(() {
      _clearCacheFuture = Disk.appDir;
    });

    var dir = (await _clearCacheFuture) as Directory;
    await dir.delete(recursive: true);
    LoginRoute.info.push(context);

    if (!mounted) return;

    setState(() {
      _clearCacheFuture = null;
    });
  }

  void _deleteProfile(WidgetRef ref) async {
    if (_deleteProfileFuture != null) return;

    var controller = ref.read(userController);

    setState(() {
      _deleteProfileFuture = controller.deleteUser();
    });

    await _deleteProfileFuture;

    if (!mounted) return;

    setState(() {
      _deleteProfileFuture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return LpContainer(
        title: t.settings_general_title,
        height: double.infinity,
        child: ListView(
          controller: ScrollController(),
          children: [
            SettingsGeneralItem(
              title: UpdaterService.currentVersionName,
              icon: Icons.update,
              onTap: () => _checkUpdates(ref),
              loading: _checkUpdatesFuture != null,
            ),
            NcSpacing.xs(),
            SettingsGeneralItem(
              title: t.settings_general_clearCache_btn,
              icon: Icons.chevron_right,
              onTap: () => lpShowConfirmDialog(
                context,
                title: t.settings_general_clearCache_title,
                message: t.settings_general_clearCache_msg,
                onConfirm: _clearCache,
              ),
            ),
            NcSpacing.xs(),
            SettingsGeneralItem(
              title: t.settings_general_deleteProfile_btn,
              icon: Icons.delete,
              onTap: () => lpShowConfirmDialog(
                context,
                title: t.settings_general_deleteProfile_title,
                message: t.settings_general_deleteProfile_msg,
                onConfirm: () => _deleteProfile(ref),
              ),
            ),
            // NcSpacing.xs(),
            // SettingsGeneralItem(
            //   title: t.settings_general_displayTaskCount,
            //   customAction: LpCheckbox(
            //     value: user.displayTaskCount,
            //     onChanged: (value) => _displayTaskCount(value, ref),
            //   ),
            // ),
            NcSpacing.xs(),
            SettingsGeneralItem(
              title: t.settings_general_credits,
              icon: Icons.info_outline,
              onTap: () => SettingsGeneralCreditsRoute.info.push(context),
            ),
          ],
        ),
      );
    });
  }
}
