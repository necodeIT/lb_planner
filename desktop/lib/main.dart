import 'dart:io';
//import 'package:catcher/catcher.dart';
import 'package:desktop/home.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NcThemes.current = NcThemes.all[User.current.settings.theme] ?? NcThemes.dark;
  // NcThemes.current = NcThemes.light;
  // FlutterError.onError = (details) => errorNotifier.emit(onError, null, details);
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(1550.0, 850.0));
    setWindowMaxSize(Size.infinite);
  }
  // runApp(app);

  // CatcherOptions config = CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  // Catcher(rootWidget: app, navigatorKey: GlobalKey<NavigatorState>());
  // Catcher.getInstance().
  runApp(app);
}

final app = MaterialApp(
  //navigatorKey: Catcher.navigatorKey,
  home: App(),
  title: "LB Planner",
  scrollBehavior: NcScrollBehavior(),
);

class Catcher {}

// final EventEmitter errorNotifier = EventEmitter();
const onError = "onError";

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // @override
  // void initState() {
  //   errorNotifier.on(
  //     onError,
  //     context,
  //     (ev, catgirl) {
  //       var error = ev.eventData as FlutterErrorDetails;

  //       showDialog(
  //         context: context,
  //         builder: (context) => NcDialog(
  //           title: "Something went wrong!",
  //           body: NcBodyText(error.context.toString()),
  //           onConfirm: () {
  //             // TODO: send crash report
  //             Navigator.of(context).pop();
  //             setState(() {});
  //           },
  //           confirmText: "Send Report",
  //         ),
  //       );
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    NcThemes.onCurrentThemeChange = () =>
        setState(() => User.current.settings.theme = NcThemes.current.name);

    return Scaffold(
      backgroundColor: NcThemes.current.secondaryColor,
      // body: NcButton(
      //     text: "Crash",
      //     onTap: () {
      //       throw Exception("Deine mom ist fett");
      //     },),
      body: Home(),
    );
  }
}
