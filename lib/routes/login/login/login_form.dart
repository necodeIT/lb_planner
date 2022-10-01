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

  _login(WidgetRef ref) async {
    var _userController = ref.read(userController);

    setState(() {
      _loginResponse = null;
      _loginFuture = _userController.login(
        _userNameController.text.trimNewLineAndWhitespace(),
        _passwordController.text.trimNewLineAndWhitespace(),
        theme: NcThemes.current.name,
        language: EnumToString.fromString(Languages.values, t.localeName)!,
      );
    });

    _loginResponse = await _loginFuture!;

    Future<ApiResponse<List<Course>>>? coursesFuture;
    ApiResponse<List<Course>>? coursesResponse;

    if (mounted) {
      var user = ref.read(userProvider);
      setState(() {
        _loginFuture = coursesFuture = (_loginResponse?.succeeded ?? false) ? CoursesApi.getAllCourses(user.token, user.id) : null;
      });
    }

    if (_loginFuture != null) {
      coursesResponse = await coursesFuture;

      if (coursesResponse?.failed ?? false) _loginResponse = await _loginFuture;
    }

    if (mounted) {
      setState(() {
        _loginFuture = null;
      });
    }

    if (mounted && (_loginResponse?.succeeded ?? false)) {
      var user = ref.read(userProvider);

      applyUserTheme(user);

      var courses = coursesResponse!.value!;

      (courses.any((e) => e.enabled) ? DashboardRoute.info : LoginSelectCoursesRoute.info).push(context);
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
                  onSubmitted: (_) => _login(ref),
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
                    child: LpButton(
                      text: t.login_login,
                      onPressed: () => _login(ref),
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
