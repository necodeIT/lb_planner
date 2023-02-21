part of lbplanner_engine;

/// Service for updating, when installed from aur package.
class AurUpdaterService extends UpdaterService {
  @override
  get installerFileName => throw UnsupportedError("AurUpdaterService does not support installerFileName");

  @override
  upgrade(Update info) async* {
    yield info.toUpdateStatus().copyWith(command: "yay -S lb-planner");
  }
}
