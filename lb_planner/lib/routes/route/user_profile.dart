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
    return Consumer(builder: (context, ref, _) {
      var user = ref.read(userProvider);

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPopupMenu(
            showArrow: false,
            verticalMargin: 0,
            position: PreferredPosition.bottom,
            child: LpIcon(Icons.notifications_outlined),
            menuBuilder: () => Container(
              color: errorColor,
              width: 300,
              height: 300,
            ),
            pressType: PressType.singleClick,
          ),
          NcSpacing.small(),
          ClipOval(
            child: Image.network(
              user.avatar,
              width: imgSize,
              height: imgSize,
            ),
          ),
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
