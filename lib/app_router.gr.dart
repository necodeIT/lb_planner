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
    AdminFeedbackRoute.name: (routeData) {
      final args = routeData.argsAs<AdminFeedbackRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AdminFeedbackScreen(
          key: args.key,
          feedbackId: args.feedbackId,
        ),
      );
    },
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
  };
}

/// generated route for
/// [AdminFeedbackScreen]
class AdminFeedbackRoute extends PageRouteInfo<AdminFeedbackRouteArgs> {
  AdminFeedbackRoute({
    Key? key,
    required int feedbackId,
    List<PageRouteInfo>? children,
  }) : super(
          AdminFeedbackRoute.name,
          args: AdminFeedbackRouteArgs(
            key: key,
            feedbackId: feedbackId,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminFeedbackRoute';

  static const PageInfo<AdminFeedbackRouteArgs> page =
      PageInfo<AdminFeedbackRouteArgs>(name);
}

class AdminFeedbackRouteArgs {
  const AdminFeedbackRouteArgs({
    this.key,
    required this.feedbackId,
  });

  final Key? key;

  final int feedbackId;

  @override
  String toString() {
    return 'AdminFeedbackRouteArgs{key: $key, feedbackId: $feedbackId}';
  }
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
