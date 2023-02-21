part of lbplanner_engine;

/// Service for updating the app, when installed from aur-git package.
class AurGitUpdaterService extends UpdaterService {
  @override
  upgrade(Update info) async* {
    yield UpdateStatus(command: "yay -S lb-planner-git");
  }
}
