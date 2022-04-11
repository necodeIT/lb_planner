import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:lb_planner/widgets.dart';
import 'package:nekolib_ui/core.dart';
import 'package:nekolib_utils/log.dart';

void main() {
  setTheme(sakuraTheme);

  Logger.init(autoSave: false);

  runThemedApp(
    appBuilder: App.builder,
    title: 'LB Planner',
    appIcon: kAppIcon,
    minSize: Size(1200, 700),
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
      theme: ThemeData(
        // todo: theme ToolbarOtpions
        cardTheme: CardTheme(
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
        ),
        hoverColor: accentColor.withOpacity(.7),
        splashColor: accentColor,
        cardColor: primaryColor,
        primaryColor: errorColor,
        brightness: brightness,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: accentColor,
          selectionColor: accentColor.withOpacity(.7),
          selectionHandleColor: accentColor,
        ),
      ),
      localizationsDelegates: const [
        LocaleNamesLocalizationsDelegate(),
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
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
  // String _test = "Test";
  final bool _test = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        color: primaryColor,
        // child: NcDropdown<String>(
        //   value: _test,
        //   items: const [
        //     DropdownMenuItem(
        //       child: Text('Test'),
        //       value: 'Test',
        //     ),
        //     DropdownMenuItem(
        //       child: Text('Test2'),
        //       value: 'Test2',
        //     ),
        //   ],
        //   onChanged: (value) => setState(() => _test = value!),
        // ),
        // child: LpButton.icon(
        //   icon: FluentIcons.arrow_circle_right_24_regular,
        //   color: errorColor,
        //   trailing: true,
        //   onPressed: () {},
        //   text: t.login,
        // ),
        // child: LpTag(
        //   color: accentColor,
        //   text: 'AM',
        // ),
        // child: LpLogo(),
        child: LpTextField(
          prefixIcon: FluentIcons.search_24_regular,
        ),
        // child: NcCheckbox(value: _test, onChanged: (value) => setState(() => _test = value)),
      ),
    );
  }
}
