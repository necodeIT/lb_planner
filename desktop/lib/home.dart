import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:desktop/widgets/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';

import 'widgets/sidebar/sidebar.dart';
import 'widgets/view.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showLogin = true;

  void handleLogin(Token token) {
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
            admin: View(
              content: Container(color: Colors.green),
              title: "Admin",
              onNavigateBack: () {
                print("dasdasdad");
              },
            ),
            calendar: Container(color: Colors.red),
            coursesOverwiev: Container(color: Colors.yellow),
            onLogout: () {},
            planner: Container(color: Colors.pink),
            settings: Container(color: Colors.black),
          );
  }
}
