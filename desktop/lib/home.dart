import 'package:desktop/widgets/views/Admin/admin_login.dart';
import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:desktop/widgets/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';

import 'widgets/sidebar/sidebar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showLogin = false;

  void handleLogin(Token token) {
    //TODO: save user to disk
    //TODO: check if user is new ? show select courses : show dashboard
    //TODO: load user theme
    setState(() {
      showLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? Login(onLoginSuccess: (token) => handleLogin(token))
        : Sidebar(
            dashboard: Dashboard(),
            admin: AdminLogin(),
            calendar: Container(color: Colors.red),
            coursesOverwiev: Container(color: Colors.yellow),
            onLogout: () {},
            planner: Container(color: Colors.pink),
            settings: Container(color: Colors.black),
          );
  }
}
