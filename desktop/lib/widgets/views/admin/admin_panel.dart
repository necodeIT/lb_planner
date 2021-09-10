import 'package:desktop/widgets/views/admin/svg/database.dart';
import 'package:desktop/widgets/views/admin/svg/feedback.dart';
import 'package:desktop/widgets/views/admin/svg/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  static const double width = 400;
  static const double height = 250;
  static const double fontSize = 20;
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return NcView.route(
      title: "Admin",
      content: NcGridView(
        maxHeight: AdminPanel.height,
        minHeight: AdminPanel.height,
        maxWidth: double.infinity,
        minWidth: AdminPanel.width,
        children: [
          NcContainer(
            label: NcTitleText("Stats", fontSize: AdminPanel.fontSize),
            leadingIcon: Icon(Icons.query_stats, size: AdminPanel.fontSize, color: NcThemes.current.textColor),
            body: NcVectorImage(code: stats_svg),
          ),
          NcContainer(
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
      ),
    );
    // return NcView(
    //   title: "Admin",
    //   content: NcGridView(
    //     children: [
    //       NcContainer(
    //         label: NcTitleText("Stats"),
    //         trailingIcon: Icon(Icons.query_stats),
    //         body: Container(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
