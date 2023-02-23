part of lbplanner_engine;

/// Service for updating the app, when packed in an AppImage.
class AppImageUpdaterService extends UpdaterService {
  @override
  get installerFileName => "LB.Planner-x86_64.AppImage";

  @override
  install(status) async* {
    //! Review required

    var oldAppImage = Platform.resolvedExecutable;
    var appImage = (await getInstallerFile()).absolute.path;

    yield status.copyWith(command: "sudo mv -f $appImage $oldAppImage && sudo chmod +x $oldAppImage && $oldAppImage");
  }
}
