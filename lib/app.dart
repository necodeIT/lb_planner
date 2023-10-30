import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/app_route.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/themes/themes.dart';

/// The root widget of the application.
///
/// This widget is responsible for routing, sets the application wide theme & language.
class App extends ConsumerWidget {
  /// The root widget of the application.
  ///
  /// This widget is responsible for routing, sets the application wide theme & language.
  App({super.key});

  /// The application router.
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(userProvider)?.locale;

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      locale: locale,
      theme: theme,
    );
  }
}
