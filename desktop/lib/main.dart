import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/base/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

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

      body: Scrollbar(
        child: ListView(
          children: [
            NcMaterialInputField(
              placeholder: "Passwort",
              // prefixIcon:
              //     Icon(Icons.access_alarms, color: NcThemes.current.textColor),
              width: 500,
            ),
            SizedBox(height: 20),
            NcInputField(
              primary: true,
              placeholder: "catgirl",
              suffixIcon:
                  Icon(Icons.ac_unit, color: NcThemes.current.textColor),
              prefixIcon: Icon(Icons.zoom_out_map_sharp,
                  color: NcThemes.current.textColor),
              width: 500,
            ),
            SizedBox(height: 20),
            NcDropdown(
                value: 1,
                items: ["catgirl", "neko", "doggirl", "foxgirl", "bunnygirl"],
                icon: Icon(Icons.ac_unit_outlined)),
            SizedBox(height: 20),
            SizedBox(height: 20),
            NcButton(
              text: "sdasda",
              onTap: switchTheme,
              width: 60,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            NcTag(
              text: "AM",
              backgroundColor: NcThemes.current.accentColor,
              width: 60,
            ),
            NcCheckBox(
              scale: 10,
              value: false,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
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
    return FlareActor("assets/Penguin.flr",
        alignment: Alignment.center,
        isPaused: false,
        fit: BoxFit.cover,
        animation: "walk",
        controller: this);
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
