import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/configs/version.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/auth/auth.dart';

/// Uses the [LoginForm] in order to render a login screen, which allows the user to login.
@RoutePage()
class LoginScreen extends StatefulWidget {
  /// Uses the [LoginForm] in order to render a login screen, which allows the user to login.
  const LoginScreen({Key? key}) : super(key: key);

  /// The padding of the login form.
  static const formPadding = 150.0;

  /// Padding of the version text.
  static const versionPadding = 20.0;

  /// The size of the logo in the login form.
  static const logoSize = 80.0;

  @override
  State<LoginScreen> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.colorScheme.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: VectorImage(
              'assets/svg/login_background.svg',
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.centerLeft,
            ),
          ),
          Consumer(builder: (context, ref, _) {
            return Positioned(
              left: LoginScreen.versionPadding,
              bottom: LoginScreen.versionPadding,
              child: Text(
                "${kBuildChannel.name}-${kAppVersion.version}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: theme.colorScheme.onPrimary),
              ),
            );
          }),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: LoginScreen.formPadding),
              child: LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
