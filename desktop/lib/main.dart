import 'dart:io';
import 'package:desktop/generated/l10n.dart';
import 'package:desktop/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  runApp(App());
}

// final app = MaterialApp(
//   localizationsDelegates: AppLocalizations.localizationsDelegates,
//   supportedLocales: AppLocalizations.supportedLocales,
//   home: App(),
//   title: "LB Planner",
//   scrollBehavior: NcScrollBehavior(),
// );

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();

  static _AppState of(BuildContext context) => context.findAncestorStateOfType<_AppState>()!;
}

class _AppState extends State<App> {
  void setLocale(Locale value) {
    setState(() {
      S.load(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Home(),
      title: "LB Planner",
      scrollBehavior: NcScrollBehavior(),
    );
  }
}
