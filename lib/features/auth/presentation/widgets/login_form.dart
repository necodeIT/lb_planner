import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Login form.
class LoginForm extends ConsumerStatefulWidget {
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

  /// Dispose of resources associated with this widget.

  @override
  void dispose() {
    _pwFocusNode.dispose();

    super.dispose();
  }

  /// Function to toggle the password visibility.
  _togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  login() {
    final tokenController = ref.watch(userTokenController);

    tokenController.login(_userNameController.text, _passwordController.text);

    hasAttemptedLogin = true;
  }

  bool hasAttemptedLogin = false;

  @override
  Widget build(BuildContext context) {
    final userToken = ref.watch(userTokenProvider);

    return Material(
      child: Container(
        color: theme.colorScheme.background,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: LoginForm.width),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(
                  size: 80,
                ),
                SizedBox(width: 30, height: 30),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintText: t.login_username,
                    errorText: userToken.hasError && hasAttemptedLogin
                        ? t.login_invalidUsernameOrPassword
                        : null,
                  ),
                  onSubmitted: (_) => _pwFocusNode.requestFocus(),
                ),
                SizedBox(width: 25, height: 25),
                TextField(
                  focusNode: _pwFocusNode,
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
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
                  onSubmitted: (_) => login,
                ),
                SizedBox(width: 30, height: 30),
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
                        : Text(t.auth_loginForm_login),
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
