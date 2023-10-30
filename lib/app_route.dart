import 'package:auto_route/auto_route.dart';
import 'features/themes/themes.dart';

part 'app_route.gr.dart';

/// The application router.
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ThemeDevelopmentRoute.page,
          path: '/theme-development',
          initial: true,
        ),
      ];
}
