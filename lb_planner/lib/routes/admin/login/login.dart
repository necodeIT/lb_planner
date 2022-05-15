part of lbplanner_routes;

/// The admin route.
class AdminLoginRoute extends StatefulWidget {
  /// The admin route.
  const AdminLoginRoute({Key? key}) : super(key: key);

  /// The name of the route.
  static const routeName = "/admin/login";

  /// The size of the user profile image.
  static const double imgSize = 100;

  @override
  State<AdminLoginRoute> createState() => _AdminLoginRouteState();
}

class _AdminLoginRouteState extends State<AdminLoginRoute> {
  Future<RawApiResponse>? _loginFuture;
  RawApiResponse? _loginResponse;

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

    if (_loginResponse?.succeeded ?? false) Navigator.of(context).pushReplacementNamed(AdminDashboardRoute.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var user = ref.watch(userProvider);

        var width = MediaQuery.of(context).size.width * 0.4;

        return SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: user.avatar,
                    width: AdminLoginRoute.imgSize,
                    height: AdminLoginRoute.imgSize,
                    placeholder: (_, __) => LpLoadingIndicator.circular(),
                    errorWidget: (_, __, ___) => LpIcon(
                      Icons.account_circle,
                      size: AdminLoginRoute.imgSize,
                    ),
                    cacheManager: CacheManager(
                      Config(
                        'user_profile',
                        stalePeriod: Duration(days: 7),
                      ),
                    ),
                  ),
                ),
              ),
              NcSpacing.large(),
              LpTextField(
                controller: _pwController,
                obscureText: true,
                errorText: (_loginResponse?.failed ?? false) ? t.admin_login_wrongPassword : null,
                placeholder: t.admin_login_pwPlaceholder,
                onSubmitted: (_) => _login(ref),
              ),
              NcSpacing.medium(),
              SizedBox(
                width: width,
                child: LpButton(
                  onPressed: () => _login(ref),
                  text: _loginFuture == null ? t.admin_login_login : null,
                  child: _loginFuture == null
                      ? null
                      : LpLoadingIndicator.circular(
                          thickness: 2,
                          size: 15,
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
