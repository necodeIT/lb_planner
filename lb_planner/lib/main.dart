import 'package:flutter/material.dart';
import 'package:lb_planner/app_icon.dart';
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
      home: Container(
        color: secondaryColor,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: accentColor,
            ),
            onPressed: () {
              if (NcThemes.current == sakuraTheme) {
                setTheme(darkTheme);
              } else {
                setTheme(sakuraTheme);
              }
            },
            child: NcTitleText(
              "Click me",
              buttonText: true,
            ),
          ),
        ),
      ),
    );
  }
}
