import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/routes.dart';
import 'package:lb_planner/updater.dart';
import 'package:lb_planner/utils.dart';
import 'package:lb_planner/widgets.dart';
import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_ui/core.dart';
import 'package:nekolib_utils/log.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  Logger.init(autoSave: true, appStoragePath: (await Disk.appDir).path);

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  runThemedApp(
    appBuilder: App.builder,
    title: 'LB Planner',
    appIcon: LpLogo.svg,
    minSize: Size(1200, 700),
    onLoad: load,
    windowHandleColor: () => primaryColor,
    loadingWidgetBuilder: (_) => LpLoadingIndicator.penguin(),
  );
}

/// Loads data from disk and returns a [Future] that completes when the data is loaded.
Future<void> load() async {
  await UserDisk.loadUser();

  if (UserDisk.data != null && !UserDisk.data!.isEmpty) {
    applyUserTheme(UserDisk.data!);
  }

  // await Future.delayed(Duration(seconds: 30));

  await kUpdater.update();
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

              // TODO: theme ToolbarOtpions

              scrollbarTheme: ScrollbarThemeData(
                thickness: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.hovered) || states.contains(MaterialState.dragged)) return 8;

                    return 6.0;
                  },
                ),
                thumbColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.hovered)) return accentColor.withOpacity(0.5);

                    if (states.contains(MaterialState.dragged)) return accentColor;

                    return tertiaryColor.withOpacity(0.5);
                  },
                ),
              ),

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
