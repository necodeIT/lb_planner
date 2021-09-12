import 'package:desktop/widgets/views/Admin/admin_login.dart';
import 'package:desktop/widgets/views/admin/admin_dashboard.dart';
import 'package:desktop/widgets/views/admin/admin_panel.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NcView(
      routes: [
        NcView.route(title: LoginRoute.name, content: LoginRoute()),
        NcView.route(title: AdminPanel.name, content: AdminPanel()),
        NcView.route(title: AdminStats.name, content: AdminStats()),
      ],
    );
  }
}
