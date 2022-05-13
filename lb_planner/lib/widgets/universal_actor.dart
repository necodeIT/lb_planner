// ignore_for_file: prefer_const_constructors_in_immutables

part of lbplanner_widgets;

/// An actor that can play rive, flare and nima animations.
class UniversalActor extends StatefulWidget {
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
  State<UniversalActor> createState() => _UniversalActorState();
}

class _UniversalActorState extends State<UniversalActor> {
  late final rive.RiveAnimationController _riveController;

  @override
  void initState() {
    _riveController = rive.SimpleAnimation(widget.animation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.filename.engine) {
      case _Engine.flr:
        return FlareActor(widget.filename, alignment: widget.alignment, fit: widget.fit, animation: widget.animation);
      case _Engine.riv:
        if (!_riveController.isActive) WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() => _riveController.isActive = true));

        return rive.RiveAnimation.asset(
          widget.filename,
          // animations: [animation],
          fit: widget.fit,
          alignment: widget.alignment,
          controllers: [_riveController],
        );
      case _Engine.nma:
        return NimaActor(widget.filename, animation: widget.animation, fit: widget.fit, alignment: widget.alignment);
    }
  }
}

extension _UniversalActorHelper on String {
  _Engine get engine => _Engine.values.firstWhere((e) => contains(".${e.name}"));
}

enum _Engine { flr, riv, nma }
