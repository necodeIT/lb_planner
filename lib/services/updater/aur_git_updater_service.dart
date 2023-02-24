part of lbplanner_engine;

/// Service for updating the app, when installed from aur-git package.
class AurGitUpdaterService extends UpdaterService {
  @override
  get installerFileName => throw UnsupportedError("AurGitUpdaterService does not support installerFileName");

  @override
  upgrade(Update info) async* {
    yield info.toUpdateStatus().copyWith(command: "yay -S lb-planner-git");
  }
}
