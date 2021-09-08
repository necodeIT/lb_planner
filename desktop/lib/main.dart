import 'dart:io';
import 'package:desktop/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';
import 'package:window_size/window_size.dart';

import 'svg/error.dart';

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

final app = MaterialApp(
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

    ErrorWidget.builder = kReleaseMode
        ? (details) => LayoutBuilder(
              builder: (context, size) {
                final message = "Internal Error:  '${details.context != null ? details.context!.name ?? noInfo : noInfo}'. Please restart the application and try again.";

                return Center(
                  child: Column(
                    children: [
                      NcSpacing.small(),
                      NcVectorImage(
                        code: error_svg,
                        width: size.maxWidth * .8,
                      ),
                      NcSpacing.small(),
                      Tooltip(
                        message: message,
                        child: NcBodyText(message),
                      ),
                      NcSpacing.small(),
                    ],
                  ),
                );
              },
            )
        : ErrorWidget.builder;

    FlutterError.onError = (details) => Guard.reportError(context, error: details);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NcThemes.current.secondaryColor,
      body: Home(),
      // body: NcTextButton(text: "sdasd", onTap: () {}),
    );
  }
}
