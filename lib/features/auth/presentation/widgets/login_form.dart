import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// A widget for user login.
///
/// This widget allows users to input their username and password,
/// with the option to toggle password visibility. It includes error handling
/// to display a message if login fails and provides a login button.
///
/// This widget is designed to be used as part of an [LoginScreen]

class LoginForm extends ConsumerStatefulWidget {
  /// A widget for user login.
  ///
  /// This widget allows users to input their username and password,
  /// with the option to toggle password visibility. It includes error handling
  /// to display a message if login fails and provides a login button.
  ///
  /// This widget is designed to be used as part of an [LoginScreen]
  const LoginForm({Key? key}) : super(key: key);

  /// The width of the login form.
  static const width = 350.0;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  final FocusNode _pwFocusNode = FocusNode();

  @override
  void dispose() {
    _pwFocusNode.dispose();

    super.dispose();
  }

  /// Shows / not shows the password in plain text
  _togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  /// Tries to login the user with the username and password entered in the form
  login() {
    final tokenController = ref.watch(userTokenRepositoryProvider);

    tokenController.login(_userNameController.text, _passwordController.text);

    hasAttemptedLogin = true;
  }

  /// tracks whether a login attempt has been made
  bool hasAttemptedLogin = false;

  @override
  Widget build(BuildContext context) {
    final userToken = ref.watch(userTokenProvider);

    return Material(
      child: Container(
        color: theme.colorScheme.background,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: LoginForm.width),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(
                  size: 80,
                ),
                const SizedBox(width: 30, height: 30),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(fontSize: 18),
                    hintText: t.login_username,
                    errorText: userToken.hasError && hasAttemptedLogin
                        ? t.login_invalidUsernameOrPassword
                        : null,
                  ),
                  onSubmitted: (_) => _pwFocusNode.requestFocus(),
                ),
                const SizedBox(width: 25, height: 25),
                TextField(
                  focusNode: _pwFocusNode,
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 18),
                      hintText: t.login_password,
                      errorText: userToken.hasError && hasAttemptedLogin
                          ? t.login_invalidUsernameOrPassword
                          : null,
                      suffix: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Icon(
                            _showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                          ),
                          onTap: _togglePassword,
                        ),
                      )),
                  onSubmitted: (_) => login(),
                ),
                const SizedBox(width: 30, height: 30),
                SizedBox(
                  width: LoginForm.width,
                  child: ElevatedButton(
                    child: userToken.isLoading
                        ? SizedBox(
                            width: 13,
                            height: 13,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: context.theme.colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : Text(t.auth_loginForm_login,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                    onPressed: login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
