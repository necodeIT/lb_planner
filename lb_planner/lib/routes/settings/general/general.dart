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

  void _checkUpdates() async {
    if (_checkUpdatesFuture != null) return;

    setState(() {
      _checkUpdatesFuture = kUpdater.update();
    });

    await _checkUpdatesFuture;

    if (!mounted) return;

    setState(() {
      _checkUpdatesFuture = null;
    });
  }

  void _clearCache(WidgetRef ref) async {
    if (_clearCacheFuture != null) return;

    var controller = ref.read(userController);

    setState(() {
      _clearCacheFuture = Disk.appDir;
    });

    var dir = (await _clearCacheFuture) as Directory;
    await dir.delete(recursive: true);
    await controller.logout();

    Navigator.of(context).pushReplacementNamed(LoginRoute.info.routeName);

    if (!mounted) return;

    setState(() {
      _clearCacheFuture = null;
    });
  }

  void _deleteProfile(WidgetRef ref) async {
    if (_deleteProfileFuture != null) return;

    // var controller = ref.read(userController);

    // setState(() {
    //   _deleteProfileFuture = controller.deleteProfile();
    // });

    // await _deleteProfileFuture;

    // if (!mounted) return;

    // setState(() {
    //   _deleteProfileFuture = null;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var updater = ref.watch(updaterProvider);

      return LpContainer(
        title: t.settings_general_title,
        height: double.infinity,
        child: ListView(
          controller: ScrollController(),
          children: [
            SettingsGeneralItem(
              title: updater.versionName,
              icon: Icons.update,
              onTap: _checkUpdates,
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
                onConfirm: () => _clearCache(ref),
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
            NcSpacing.xs(),
            SettingsGeneralItem(
              title: t.settings_general_credits,
              icon: Icons.info_outline,
              onTap: () => Navigator.of(context).pushReplacementNamed(SettingsGeneralCreditsRoute.routeName),
            ),
          ],
        ),
      );
    });
  }
}
