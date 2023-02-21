part of lbplanner_engine;

/// Service for updating, when installed from aur package.
class AurUpdaterService extends UpdaterService {
  @override
  upgrade(Update info) async* {
    yield UpdateStatus(command: "yay -S lb-planner");
  }
}
