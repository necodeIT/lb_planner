import 'package:desktop/widgets/views/admin/admin_dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AdminDashboardItem(icon: FontAwesome5Solid.user_alt, number: "150", headline: "Users"),
            NcSpacing.medium(),
            AdminDashboardItem(icon: Feather.log_out, number: "150", headline: "Daily Logins"),
            NcSpacing.medium(),
            AdminDashboardItem(icon: Feather.server, number: "150", headline: "Polls Today"),
          ],
        ),
        NcSpacing.medium(),
        //   Row(
        //     children: [
        //       AdminDashboardItem(icon: , number: "150", headline: "Using 桜-Theme"),
        //       NcSpacing.medium(),
        //       AdminDashboardItem(icon: Feather.log_out, number: "150", headline: "Using Dark-Theme"),
        //       NcSpacing.medium(),
        //       AdminDashboardItem(icon: Feather.server, number: "150", headline: "Using Ocean-Theme"),
        //     ],
        //   ),
        //   NcSpacing.medium(),
        //   AdminDashboardItem(icon: icon, number: "150", headline: "Using Light-Theme")
      ],
    );
  }
}
