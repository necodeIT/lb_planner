import 'package:desktop/widgets/views/admin/admin_dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class AdminStats extends StatelessWidget {
  const AdminStats({Key? key}) : super(key: key);

  static const name = "AdminDashboard";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: AdminDashboardItem(icon: FontAwesome5Solid.user_alt, number: "150", headline: "Users")),
              NcSpacing.medium(),
              Expanded(child: AdminDashboardItem(icon: Feather.log_out, number: "150", headline: "Daily Logins")),
              NcSpacing.medium(),
              Expanded(child: AdminDashboardItem(icon: Feather.server, number: "150", headline: "Polls Today")),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          child: Row(
            children: [
              NcContainer(
                label: 
                  SizedBox.shrink(),
                  labelPadding: false,
                body: 
                  Row(
                    children: [],
                  ),
              ),
            ],
          )
        ),
        NcSpacing.medium(),
        Expanded(
          child: NcGridView.responsive(
            minHeight: 80,
            margin: EdgeInsets.zero,
            minWidth: 300,
            maxHeight: 80,
            children: [
              for (var theme in NcThemes.all.values) AdminDashboardItem(icon: theme.icon, number: "150", headline: "Using ${theme.name}-Theme"),
            ],
          ),
        ),
      ],
    );
  }
}
