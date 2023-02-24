part of lbplanner_engine;

/// Service for updating the app, when compiled from source.
class SelfCompiledUpdaterService extends UpdaterService {
  @override
  get installerFileName => throw UnsupportedError("SelfCompiledUpdaterService does not support installerFileName");

  @override
  upgrade(Update info) async* {
    //! Review required
    yield info.toUpdateStatus().copyWith(command: "git pull && fvm use && flutter pub get && flutter build ${Platform.operatingSystem} --no-sound-null-safety");
  }
}
