import 'dart:async';
import 'dart:io';
import 'dart:math';
//import 'package:catcher/catcher.dart';
import 'package:desktop/dialogs/not_implemented_dialog.dart';
import 'package:desktop/home.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NcThemes.current = NcThemes.all[User.current.settings.theme] ?? NcThemes.dark;
  // NcThemes.current = NcThemes.light;
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(1550.0, 850.0));
    setWindowMaxSize(Size.infinite);
  }

  // ErrorWidget.builder = (details) => ErrorReporter(details: details);
  // ErrorWidget.

  // runApp(app);

  runApp(app);
}

final app = MaterialApp(
  //navigatorKey: Catcher.navigatorKey,
  home: App(),
  title: "LB Planner",
  scrollBehavior: NcScrollBehavior(),
);

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    NcThemes.onCurrentThemeChange = () => setState(() => User.current.settings.theme = NcThemes.current.name);

    FlutterError.onError = (details) => reportError(context, error: details);
    // FlutterError.onError = (details) => print("fett");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NcThemes.current.secondaryColor,
      body: NcButton(
        text: "Crash",
        onTap: () {
          // guard(
          //   context,
          //   () {
          //     throw Exception("testytest");
          //   },
          // );
          throw Exception("Catch me");
        },
      ),
      // body: Home(),
    );
  }
}
