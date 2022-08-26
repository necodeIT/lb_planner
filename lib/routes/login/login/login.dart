part of lbplanner_routes;

/// Login route
class LoginRoute extends StatefulWidget {
  /// Login route
  const LoginRoute({Key? key}) : super(key: key);

  /// Info about the route
  static final info = RouteInfo(routeName: "/login", builder: (_, __) => LoginRoute(), standalone: true);

  /// The padding of the login form.
  static const formPadding = 150.0;

  /// Padding of the version text.
  static const versionPadding = 20.0;

  /// The size of the logo in the login form.
  static const logoSize = 80.0;

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: NcVectorImage(
            code: svg_login_background,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.centerLeft,
          ),
        ),
        Consumer(builder: (context, ref, _) {
          return Positioned(
            left: LoginRoute.versionPadding,
            bottom: LoginRoute.versionPadding,
            child: NcBodyText(
              ref.read(updaterProvider).versionName,
              buttonText: true,
            ),
          );
        }),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: LoginRoute.formPadding),
            child: LoginForm(),
          ),
        ),
      ],
    );
  }
}
