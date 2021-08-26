import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/base/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/themes/theme.dart';
import 'package:lb_planner/ui/widgets/boxes/boxes.dart';
import 'package:lb_planner/ui/widgets/buttons/text_buttton.dart';
import 'package:lb_planner/ui/widgets/dropdown/dropdown.dart';
import 'package:lb_planner/ui/widgets/input_fields/input_fields.dart';
import 'package:lb_planner/ui/widgets/subject_icon/subjects.dart';

void main() {
  NcThemes.current = NcThemes.dark;
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    NcThemes.onCurrentThemeChange = () => setState(() => {});
    return Scaffold(
        backgroundColor: NcThemes.current.secondaryColor,
        // backgroundColor: Colors.amber,
        body: Column(
          children: [
           NcSubject(subjectName: "AM", backgroundColor: NcThemes.current.tertiaryColor)
          ],
        )
        // body: Penguin(),
        );
  }

  switchTheme() {
    if (NcThemes.current == NcThemes.dark)
      NcThemes.current = NcThemes.ocean;
    else
      NcThemes.current = NcThemes.dark;
  }
}

class Penguin extends StatefulWidget {
  Penguin({
    Key? key,
  }) : super(key: key);
  _PenguinState createState() => _PenguinState();
}

class _PenguinState extends State<Penguin> with FlareController {
  ActorAnimation? _rock;

  double _rockAmount = 0.5;

  double _speed = 1.0;

  double _rockTime = 0.0;

  @override
  Widget build(BuildContext context) {
    return FlareActor("assets/Penguin.flr", alignment: Alignment.center, isPaused: false, fit: BoxFit.cover, animation: "walk", controller: this);
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
