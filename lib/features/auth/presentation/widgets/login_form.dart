import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Login form.
class LoginForm extends ConsumerStatefulWidget {
  /// Login form.
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

  _togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final tokenController = ref.watch(userTokenController);

    final userToken = ref.watch(userTokenProvider);

    return ConstrainedBox(
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
                helperText: t.login_username,
                errorText: t.login_invalidUsernameOrPassword,
              ),
              onSubmitted: (_) => _pwFocusNode.requestFocus(),
            ),
            SizedBox(width: 25, height: 25),
            TextField(
              focusNode: _pwFocusNode,
              controller: _passwordController,
              obscureText: !_showPassword,
              decoration: InputDecoration(
                  helperText: t.login_username,
                  errorText: t.login_invalidUsernameOrPassword,
                  suffix: GestureDetector(
                    child: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                    ),
                    onTap: _togglePassword,
                  )),
              onSubmitted: (_) => tokenController.login(
                  _userNameController.text, _passwordController.text),
            ),
            SizedBox(width: 30, height: 30),
            SizedBox(
              width: LoginForm.width,
              child: ElevatedButton(
                child: userToken.isLoading
                    ? SizedBox(
                        width: LoginForm.width,
                        child: CircularProgressIndicator())
                    : Text(t.auth_loginForm_login),
                onPressed: () => tokenController.login(
                    _userNameController.text, _passwordController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
