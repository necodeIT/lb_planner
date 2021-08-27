import 'package:flare_flutter/base/animation/actor_animation.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

class NcLoadingIndicator extends StatefulWidget {
  NcLoadingIndicator({Key? key, this.width, this.height}) : super(key: key);
  _NcLoadingIndicatorState createState() => _NcLoadingIndicatorState();

  final double? width;
  final double? height;
}

class _NcLoadingIndicatorState extends State<NcLoadingIndicator>
    with FlareController {
  ActorAnimation? _rock;

  double _rockAmount = 0.5;

  double _speed = 1.0;

  double _rockTime = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: FlareActor("assets/Penguin.flr",
          alignment: Alignment.center,
          isPaused: false,
          fit: BoxFit.cover,
          animation: "walk",
          controller: this),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _rockTime += elapsed * _speed;
    _rock!.apply(_rockTime % _rock!.duration, artboard, _rockAmount);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _rock = artboard.getAnimation("music_walk");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
