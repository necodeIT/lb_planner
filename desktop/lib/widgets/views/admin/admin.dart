import 'package:desktop/widgets/views/Admin/admin_login.dart';
import 'package:desktop/widgets/views/admin/admin_panel.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class Admin extends StatefulWidget {
  const Admin({ Key? key }) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  AdminState state = AdminState.AdminLogin;
  _showAdminLogin(){
    setState(() {
      state = AdminState.AdminLogin;
    });
  }
  _showAdminPanel(){
    setState(() {
      state= AdminState.AdminPanel;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
enum AdminState {AdminLogin, AdminPanel}