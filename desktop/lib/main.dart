import 'dart:io';
import 'package:desktop/home.dart';
import 'package:desktop/widgets/views/select_courses/select_courses.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';
import 'package:window_size/window_size.dart';

import 'widgets/views/courses_overview/course_stats/course_stats_chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NcThemes.current = NcThemes.all[User.current.settings.theme] ?? NcThemes.dark;
  // NcThemes.current = NcThemes.light;
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(1550.0, 850.0));
    setWindowMaxSize(Size.infinite);
  }
  runApp(app);
}

final app = MaterialApp(home: App(), title: "LB Planner", scrollBehavior: NcScrollBehavior());

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
    NcThemes.onCurrentThemeChange = () => setState(() => User.current.settings.theme = NcThemes.current.name);
    return Scaffold(
      backgroundColor: NcThemes.current.secondaryColor,
      body: Home(),
      // body: CourseStatsChart(stats: StatusProfile(done: 10, late: 15, uploaded: 20, pending: 5)),
    );
  }
}
