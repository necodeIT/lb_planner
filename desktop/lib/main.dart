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
        backgroundColor: NcThemes.current.tertiaryColor,
        // backgroundColor: Colors.amber,

        body: NcLoadingIndicator()
        // body: Penguin(),
        );
  }

  switchTheme() {
    if (NcThemes.current == NcThemes.dark)
      NcThemes.current = NcThemes.ocean;
    else if (NcThemes.current == NcThemes.ocean)
      NcThemes.current = NcThemes.light;
    else if (NcThemes.current == NcThemes.light)
      NcThemes.current = NcThemes.sakura;
    else if (NcThemes.current == NcThemes.sakura) NcThemes.current = NcThemes.dark;
  }
}
