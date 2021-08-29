import 'dart:io';

import 'package:desktop/widgets/dashboard/exams.dart';
import 'package:desktop/widgets/dashboard/todays_task.dart';
import 'package:desktop/widgets/sidebar/sidebar.dart';
import 'package:desktop/widgets/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NcThemes.current = NcThemes.dark;
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(950, 550));
    setWindowMaxSize(Size.infinite);
  }
  runApp(app);
}

final app = MaterialApp(home: App(), title: "LB Planner");

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
      backgroundColor: NcThemes.current.secondaryColor,
      body: Login(),
      // body: Sidebar(
      //   dashboard: Container(color: Colors.amber),
      //   admin: Container(color: Colors.green),
      //   calendar: Container(color: Colors.red),
      //   coursesOverwiev: Container(color: Colors.yellow),
      //   onLogout: () {},
      //   planner: Container(color: Colors.pink),
      //   settings: Container(color: Colors.black),
      // ),
      //body: Dashboard_TodaysTasksItem(),
      //body: Dashboard_ExamItem(),
    );
  }
}
