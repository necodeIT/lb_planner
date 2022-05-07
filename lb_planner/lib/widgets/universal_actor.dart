// ignore_for_file: prefer_const_constructors_in_immutables

part of lbplanner_widgets;

/// An actor that can play rive, flare and nima animations.
class UniversalActor extends StatelessWidget {
  /// An actor that can play rive, flare and nima animations.
  UniversalActor(this.filename, {Key? key, this.fit = BoxFit.scaleDown, required this.animation, this.alignment = Alignment.center}) : super(key: key);

  /// An actor that can play rive, flare and nima animations.
  ///
  /// This constructor uses information provided in [RiveAnimation].
  UniversalActor.fromRiveAnimation(RiveAnimation riveAnimation, {Key? key, this.fit = BoxFit.scaleDown, this.alignment = Alignment.center}) : super(key: key) {
    filename = riveAnimation.filename;
    animation = riveAnimation.animation;
  }

  /// How the animation should be fitted to its parent.
  final BoxFit fit;

  /// The filename of the animation.
  late final String filename;

  /// The animation to play.
  late final String animation;

  /// The alignment of the animation.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    switch (filename.engine) {
      case _Engine.flr:
        return FlareActor(filename, alignment: alignment, fit: fit, animation: animation);
      case _Engine.rive:
        return rive.RiveAnimation.asset(filename, animations: [animation], fit: fit, alignment: alignment);
      case _Engine.nma:
        return NimaActor(filename, animation: animation, fit: fit, alignment: alignment);
    }
  }
}

extension _UniversalActorHelper on String {
  _Engine get engine => _Engine.values.firstWhere((e) => contains(".${e.name}"));
}

enum _Engine { flr, rive, nma }
