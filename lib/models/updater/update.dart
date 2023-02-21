import 'package:freezed_annotation/freezed_annotation.dart';

part 'update.freezed.dart';

@freezed

/// Information about the latest update.
class Update with _$Update {
  const Update._();

  /// Information about the latest update.
  const factory Update({
    @Default(false) bool updateAvailable,
    @Default("") String remoteVersion,
    @Default("") String remoteVersionName,
    @Default("") String patchNotes,
    @Default(<String, String>{}) UpdateAssets assets,
  }) = _Update;
}

/// A map with the key being the asset name and the value being the download url of the asset.
typedef UpdateAssets = Map<String, String>;
