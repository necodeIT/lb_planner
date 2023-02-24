part of lbplanner_engine;

/// Service for updating the app, when installed from a Setup.dmg file.
class DmgUpdaterService extends UpdaterService {
  @override
  get installerFileName => "LB.Planner.Setup.dmg";
}
