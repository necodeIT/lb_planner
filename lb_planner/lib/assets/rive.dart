// ignore_for_file: constant_identifier_names

part of lbplanner_assets;

/// THe root folder all rive assets.
const kRiveFolder = "$kAssetsFolder/rive";

/// 'penguin.flr' asset.
///
/// [© JcToon](https://flare.rive.app/a/JuanCarlos/files/recent/all) • [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
const assets_rive_penguin = "$kRiveFolder/penguin.flr";

/// 'Newton.nma2d' asset.
///
/// [© JcToon](https://flare.rive.app/a/JuanCarlos/files/recent/all) • [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
const assets_rive_newton = "$kRiveFolder/Newton.nma";

/// 'Liquid Downlad.flr' asset.
///
/// [© Guido Rosso](https://flare.rive.app/a/pollux/files/recent/all) • [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
const assets_rive_liquidDownload = "$kRiveFolder/Liquid Download.flr";

/// All loading animations.
const kLoadingAnimations = [
  animations_rive_penguin,
  animations_rive_liquidDownload,
];

/// Looping [assets_rive_newton] animation.
const animations_rive_newton = RiveAnimation(assets_rive_newton, "Idle");

/// Looping [assets_rive_penguin] animation.
const animations_rive_penguin = RiveAnimation(assets_rive_penguin, "walk");

/// Looping [assets_rive_liquidDownload] animation.
const animations_rive_liquidDownload = RiveAnimation(assets_rive_liquidDownload, "Indeterminate");

/// Looping rive animation.
class RiveAnimation {
  /// The filename of the animation.
  final String filename;

  /// The animation to play.
  final String animation;

  /// Looping rive animation.
  const RiveAnimation(this.filename, this.animation);

  @override
  String toString() => filename;
}
