import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Feather.bell,
          color: NcThemes.current.textColor,
        ),
        NcSpacing.medium(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NcCaptionText(
              'tbeck',
              //User.current.name,
              fontSize: 22,
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
            "assets/placeholders/profile.png",
            width: 60,
            //height: ,
          ),
        )
      ],
    );
  }
}
