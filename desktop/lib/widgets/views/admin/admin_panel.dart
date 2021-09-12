import 'package:desktop/widgets/views/admin/admin_dashboard.dart';
import 'package:desktop/widgets/views/admin/svg/database.dart';
import 'package:desktop/widgets/views/admin/svg/feedback.dart';
import 'package:desktop/widgets/views/admin/svg/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  static const double width = 400;
  static const double height = 250;
  static const double fontSize = 20;
  static const name = "Admin";

  @override
  Widget build(BuildContext context) {
    return NcGridView.responsive(
      minHeight: AdminPanel.height,
      minWidth: AdminPanel.width,
      maxHeight: AdminPanel.height,
      children: [
        GestureDetector(
          onTap: () {
            NcView.of(context).route(AdminStats.name);
          },
          child: NcContainer(
            height: AdminPanel.height,
            width: AdminPanel.width,
            label: NcTitleText("Stats", fontSize: AdminPanel.fontSize),
            leadingIcon: Icon(Icons.query_stats, size: AdminPanel.fontSize, color: NcThemes.current.textColor),
            body: NcVectorImage(code: stats_svg),
          ),
        ),
        NcContainer(
          height: AdminPanel.height,
          width: AdminPanel.width,
          label: NcTitleText("Feedback", fontSize: AdminPanel.fontSize),
          leadingIcon: Icon(Icons.chat_bubble, size: AdminPanel.fontSize, color: NcThemes.current.textColor),
          body: NcVectorImage(code: feedback_svg),
        ),
        NcContainer(
          height: AdminPanel.height,
          width: AdminPanel.width,
          label: NcTitleText("Database", fontSize: AdminPanel.fontSize),
          leadingIcon: Icon(FontAwesome5Solid.database, size: AdminPanel.fontSize, color: NcThemes.current.textColor),
          body: NcVectorImage(code: database_svg),
        ),
      ],
    );
  }
}
