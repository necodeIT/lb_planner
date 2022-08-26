part of lbplanner_routes;

/// Displays the current user and notifications.
class UserProfile extends StatelessWidget {
  /// Displays the current user and notifications.
  const UserProfile({Key? key}) : super(key: key);

  /// The size of the avatar.
  static const imgSize = 40.0;

  /// The font size of the user name.
  static const nameSize = 18.0;

  /// The font size of the user's access level.
  static const accessLevelSize = 12.0;

  @override
  Widget build(BuildContext context) {
    var _key = GlobalKey();
    return Consumer(builder: (context, ref, _) {
      var user = ref.read(userProvider);

      return Row(
        key: _key,
        mainAxisSize: MainAxisSize.min,
        children: [
          UserNotifications(),
          NcSpacing.small(),
          UserProfileImg(size: imgSize),
          NcSpacing.small(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NcCaptionText(
                user.fullname,
                fontSize: nameSize,
              ),
              NcBodyText(
                EnumToString.convertToString(user.accessLevel, camelCase: true),
                color: accentColor,
                fontSize: accessLevelSize,
              ),
            ],
          )
        ],
      );
    });
  }
}
