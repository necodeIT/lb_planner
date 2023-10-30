import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Sets up [PathProviderPlatform.instance] to use [TestPathProviderPlatform].
void useTestPathProviderPlatform() {
  TestWidgetsFlutterBinding.ensureInitialized();
  PathProviderPlatform.instance = TestPathProviderPlatform();
}

/// Deletes the `testing` directory.
///
/// This should always be called
/// - whenever [useTestPathProviderPlatform] is called
/// - in [tearDownAll] and [setUpAll] to ensure that the test directory is always clean before and after each test
void clearTestDir() {
  final dir = Directory(TestPathProviderPlatform.kBasePath);

  if (dir.existsSync()) dir.deleteSync(recursive: true);
}

/// A fake implementation of [PathProviderPlatform] that returns a fixed path.
///
/// The path is `/testing` in the project root.
class TestPathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  static const kBasePath = 'testing';

  @override
  Future<String?> getTemporaryPath() async {
    return "$kBasePath/temp";
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return "$kBasePath/app_support";
  }

  @override
  Future<String?> getLibraryPath() async {
    return "$kBasePath/library";
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return "$kBasePath/apps";
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return "$kBasePath/external_storage";
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return <String>["$kBasePath/external_cache"];
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return <String>["$kBasePath/external_storage"];
  }

  @override
  Future<String?> getDownloadsPath() async {
    return "$kBasePath/downloads";
  }
}
