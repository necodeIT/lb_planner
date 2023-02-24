part of lbplanner_engine;

/// The download and installation status of an update.
enum DownloadStatus {
  /// No download or installation is in progress.
  idle,

  /// Update is being downloaded.
  downlaoding,

  /// Update is being installed.
  installing,

  /// An error occured while downloading or installing the update.
  error,
}
