part of lbplanner_routes;

/// Displays the profile image of the current user with the current size.
class UserProfileImg extends StatelessWidget {
  /// Displays the profile image of the current user with the current size.
  const UserProfileImg({Key? key, required this.size, this.userId}) : super(key: key);

  /// The size of the profile image.
  final double size;

  /// The id of the user to display. If not specified, the current user is used.
  final int? userId;

  /// Cache manager for the profile image.
  static CacheManager get cacheManager => CacheManager(
        Config(
          'user_profile',

          // ignore: no-magic-number
          stalePeriod: Duration(days: 7),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var user = userId != null ? ref.watch(usersProvider)[userId] : ref.watch(userProvider);

        return ClipOval(
          child: ConditionalWidget(
            condition: user != null && user.avatar.isNotEmpty,
            trueWidget: (_) => CachedNetworkImage(
              imageUrl: user!.avatar,
              width: size,
              height: size,
              fit: BoxFit.contain,
              placeholder: (_, __) => LpLoadingIndicator.circular(),
              errorWidget: (_, __, ___) => LpIcon(
                Icons.account_circle,
                size: size,
              ),
              cacheManager: cacheManager,
            ),
            falseWidget: (_) => LpShimmer(height: size, width: size),
          ),
        );
      },
    );
  }
}
