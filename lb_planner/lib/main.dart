import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/routes.dart';
import 'package:lb_planner/widgets.dart';
import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_ui/core.dart';
import 'package:nekolib_utils/log.dart';

void main() {
  setTheme(darkTheme);

  Logger.init(autoSave: false);

  runThemedApp(
    appBuilder: App.builder,
    title: 'LB Planner',
    appIcon: LpLogo.svg,
    minSize: Size(1200, 700),
    windowHandleColor: () => primaryColor,
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
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, _) {
          var user = ref.read(userProvider);

          return MaterialApp(
            theme: ThemeData(
              splashFactory: NoSplash.splashFactory,

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
            navigatorObservers: [kRouteObserver],
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            initialRoute: user.restricted ? LoginRoute.routeName : DashboardRoute.routeName,
            // builder: RouteWrapper.wrap,
            // routes: kRoutes,
            onGenerateRoute: RouteWrapper.gnerateRoute,
          );
        },
      ),
    );
  }
}
