// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ThemeDevelopmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ThemeDevelopmentScreen()),
      );
    },
    UpdateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateScreen(),
      );
    },
  };
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ThemeDevelopmentScreen]
class ThemeDevelopmentRoute extends PageRouteInfo<void> {
  const ThemeDevelopmentRoute({List<PageRouteInfo>? children})
      : super(
          ThemeDevelopmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeDevelopmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateScreen]
class UpdateRoute extends PageRouteInfo<void> {
  const UpdateRoute({List<PageRouteInfo>? children})
      : super(
          UpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
