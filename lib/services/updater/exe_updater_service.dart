part of lbplanner_engine;

/// Service for updating the app, when installed from an Setup.exe file.
class ExeUpdaterService extends UpdaterService {
  @override
  get installerFileName => "LB.Planner.Setup.exe";
}
