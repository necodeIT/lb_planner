import 'package:flutter/material.dart';
import 'package:lb_planner/app_icon.dart';
import 'package:lb_planner/widgets.dart';
import 'package:nekolib_ui/core.dart';

void main() {
  runThemedApp(
    appBuilder: App.builder,
    title: 'LB Planner',
    appIcon: kAppIcon,
  );
}

/// Main app widget.
class App extends StatelessWidget {
  /// Main app widget.
  const App({Key? key}) : super(key: key);

  /// Builder for convinience.
  static App builder(context) => App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: secondaryColor,
        body: Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => TestState();
}

class TestState extends State<Test> {
  bool _test = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NcCheckbox(
        value: _test,
        onChanged: (value) => setState(
          () {
            _test = value;
          },
        ),
      ),
    );
  }
}
