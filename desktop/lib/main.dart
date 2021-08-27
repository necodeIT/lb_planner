import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  NcThemes.current = NcThemes.dark;
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    NcThemes.onCurrentThemeChange = () => setState(() => {});
    return Scaffold(
      backgroundColor: NcThemes.current.tertiaryColor,
      // backgroundColor: Colors.amber,

      body: NcTextButton(
        text: "sdasdasd",
        onTap: switchTheme,
        leadingIcon: Icon(Feather.arrow_left_circle, color: NcThemes.current.textColor),
      ),
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
