part of lbplanner_routes;

/// Login form.
class LoginForm extends StatefulWidget {
  /// Login form.
  const LoginForm({Key? key}) : super(key: key);

  /// The width of the login form.
  static const width = 350.0;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  RawApiResponse? _loginResponse;
  Future<RawApiResponse>? _loginFuture;
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

  _login(UserProvider user) async {
    setState(() {
      _loginFuture = user.login(
        _userNameController.text.trimNewLineAndWhitespace(),
        _passwordController.text.trimNewLineAndWhitespace(),
        theme: NcThemes.current.name,
        language: EnumToString.fromString(Languages.values, t.localeName)!,
      );
    });

    _loginResponse = await _loginFuture!;

    if (mounted) {
      setState(() {
        _loginFuture = null;
      });
    }

    if (mounted && (_loginResponse?.succeeded ?? false)) {
      Navigator.of(context).pushNamed(DashboardRoute.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var errorMessage = _loginResponse?.failed ?? false ? t.login_invalidUsernameOrPassword : null;

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
                  onSubmitted: (_) => _login(ref.read(userProvider.notifier)),
                  suffix: IconButton(
                    icon: LpIcon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                    ),
                    splashRadius: 0.1,
                    onPressed: _togglePassword,
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
                          child: Center(
                            child: SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: buttonTextColor,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: LpButton(
                      text: t.login_login,
                      onPressed: () => _login(ref.read(userProvider.notifier)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
