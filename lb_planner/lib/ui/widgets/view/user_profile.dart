import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class NcUserProfile extends StatelessWidget {
  const NcUserProfile({Key? key, this.onShowNotifications}) : super(key: key);

  final Function()? onShowNotifications;

  static const double ppWidth = 60;
  static const double nameSize = 22;
  static const double bellSize = 25;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onShowNotifications,
          child: Icon(
            Feather.bell,
            color: NcThemes.current.textColor,
            size: bellSize,
          ),
        ),
        NcSpacing.medium(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NcCaptionText(
              User.current.name,
              fontSize: nameSize,
            ),
            Text(
              User.current.role.toString().substring(
                    User.current.role.toString().indexOf('.') + 1,
                  ),
              style: TextStyle(
                fontWeight: NcBodyText.baseStyle.fontWeight,
                color: NcThemes.current.accentColor,
                fontSize: 15,
              ),
            )
          ],
        ),
        NcSpacing.small(),
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(
            // TODO: get user profile
            "assets/placeholders/profile.png",
            width: ppWidth,
            //height: ,
          ),
        )
      ],
    );
  }
}
