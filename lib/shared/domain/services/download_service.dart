import 'dart:io';

/// Base class for all download services.
///
/// A download service is responsible for downloading a file from a given URL.
abstract class DownloadService {
  /// Downloads a file from a given [url] to the temporary directory with the given [name].
  ///
  /// Returns a future that resolves to the downloaded [File].
  ///
  /// Use [onProgress] to get notified about the download progress
  ///   - `total` is the total number of bytes to download
  ///   - `downloaded` is the number of bytes that have been downloaded so far
  ///   - `percent` is the percentage of the download that has been completed (between 0 and 1)
  ///
  /// Throws an [Exception] if the download fails.
  Future<File> download(
    String url,
    String name, {
    void Function(int total, int downloaded, double percent)? onProgress,
  });
}
