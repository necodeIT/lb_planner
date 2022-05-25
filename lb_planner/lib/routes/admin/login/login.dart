part of lbplanner_routes;

/// The admin route.
class AdminLoginRoute extends StatefulWidget {
  /// The admin route.
  const AdminLoginRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(routeName: "/admin/login", builder: (_) => AdminLoginRoute(), titleGenerator: (t) => t.admin_login_routeName);

  /// The size of the user profile image.
  static const double imgSize = 150;

  /// The width of the login form.
  static const double width = 450;

  /// The font size of the user name.
  static const double fontSize = 30;

  @override
  State<AdminLoginRoute> createState() => _AdminLoginRouteState();
}

class _AdminLoginRouteState extends State<AdminLoginRoute> {
  Future<RawApiResponse>? _loginFuture;
  RawApiResponse? _loginResponse;
  bool _showPassword = false;

  _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final TextEditingController _pwController = TextEditingController();

  _login(WidgetRef ref) async {
    setState(() {
      _loginFuture = null;
      _loginResponse = null;
    });

    var user = ref.read(userProvider);

    setState(() {
      _loginFuture = UserApi.login(user.username, _pwController.text);
    });

    _loginResponse = await _loginFuture;

    if (!mounted) return;

    setState(() {
      _loginFuture = null;
    });

    if (_loginResponse?.succeeded ?? false) AdminDashboardRoute.info.push(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var user = ref.watch(userProvider);

        return SizedBox(
          width: AdminLoginRoute.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: UserProfileImg(size: AdminLoginRoute.imgSize),
              ),
              NcSpacing.xl(),
              NcCaptionText(
                user.fullname,
                fontSize: AdminLoginRoute.fontSize,
              ),
              NcSpacing.xl(),
              NcSpacing.xl(),
              LpTextField(
                autoFocus: true,
                controller: _pwController,
                obscureText: !_showPassword,
                errorText: (_loginResponse?.failed ?? false) ? t.admin_login_wrongPassword : null,
                placeholder: t.admin_login_pwPlaceholder,
                onSubmitted: (_) => _login(ref),
                suffix: LpGestureDetector(
                  child: LpIcon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                    size: LpTextField.defaultFontSize,
                  ),
                  onTap: _toggleShowPassword,
                ),
              ),
              NcSpacing.medium(),
              SizedBox(
                width: AdminLoginRoute.width,
                child: LpButton(
                  onPressed: () => _login(ref),
                  text: _loginFuture == null ? t.admin_login_login : null,
                  child: _loginFuture == null
                      ? null
                      : LpLoadingIndicator.circular(
                          color: buttonTextColor,
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
