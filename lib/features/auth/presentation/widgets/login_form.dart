import 'package:flutter/cupertino.dart';
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
  
    userToken.when(
      data: (token) {
        if (token != null) {
          Navigator.of(context).pushReplacementNamed(DashboardRoute.name);
        }
      },
      loading: () {
        
      },


      error: (error, stackTrace) {

      },
    );


        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: LoginForm.width),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LpLogo(size: LoginRoute.logoSize),
                NcSpacing.xl(),
                LpTextField(
                  controller: _userNameController,
                  placeholder: t.login_username,
                  errorText: errorMessage,
                  onSubmitted: (_) => _pwFocusNode.requestFocus(),
                ),
                NcSpacing.large(),
                LpTextField(
                  focusNode: _pwFocusNode,
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  placeholder: t.login_password,
                  errorText: errorMessage,
                  onSubmitted: (_) => tokenController.login(_userNameController.text, _passwordController.text),
                  suffix: LpGestureDetector(
                    child: LpIcon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      size: LpTextField.defaultFontSize,
                    ),
                    onTap: _togglePassword,
                  ),
                ),
                NcSpacing.xl(),
                SizedBox(
                  width: LoginForm.width,
                  child: ConditionalWrapper(
                    condition: _loginFuture != null,
                    wrapper: (context, _) => FutureBuilder(
                      future: _loginFuture!,
                      builder: (context, snapshot) => LpButton(
                        onPressed: () {},
                        child: SizedBox(
                            width: LoginForm.width,
                            child: LpLoadingIndicator.circular(
                              color: buttonTextColor,
                            )),
                      ),
                    ),
                    child: ElevatedButton(
                      child: Text(t.auth_loginForm_login),
                      onPressed: () => tokenController.login(_userNameController.text, _passwordController.text),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      
  
  }
}