import 'dart:io';

import 'package:lb_planner/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

/// Implements [DownloadService] using [Dio].
class DioDownloadService extends DownloadService {
  /// The [Dio] instance to use for downloading.
  final Dio dio;

  /// Implements [DownloadService] using [Dio].
  DioDownloadService(this.dio);

  @override
  Future<File> download(
    String url,
    String name, {
    void Function(int total, int downloaded, double percent)? onProgress,
  }) async {
    log('Downloading file from $url to temporary directory with name $name');

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$name');

    await dio.download(
      url,
      file.path,
      onReceiveProgress: (count, total) {
        onProgress?.call(total, count, count / total);
      },
    );

    if (!file.existsSync()) throw Exception('Download failed');

    log('Download complete, file saved to ${file.path}');

    return file;
  }
}
