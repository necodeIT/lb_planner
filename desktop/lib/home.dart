import 'package:desktop/widgets/views/Admin/admin_login.dart';
import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:desktop/widgets/views/login/login.dart';
import 'package:desktop/widgets/views/select_courses/select_courses.dart';
import 'package:desktop/widgets/views/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

import 'widgets/sidebar/sidebar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState state = HomeState.Login;

  void handleLogin(Token token) {
    //TODO: save user to disk
    //TODO: load user theme
    setState(() {
      //TODO: check if user is new ? show select courses : show dashboard
      state = HomeState.SelectCourses;
    });
  }

  logout() {
    setState(() {
      state = HomeState.Login;
    });
  }

  submitCourseSelection() {
    // TODO: fetch selected courses
    // TODO save selection to server
    setState(() {
      state = HomeState.Sidebar;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case HomeState.Login:
        return Login(onLoginSuccess: (token) => handleLogin(token));

      case HomeState.SelectCourses:
        return SelectCoursesView(onSubmit: submitCourseSelection);

      case HomeState.Sidebar:
        return Sidebar(
          dashboard: Dashboard(),
          calendar: Container(color: Colors.red),
          coursesOverwiev: Container(color: Colors.yellow),
          planner: NcCommingSoon(),
          admin: AdminLogin(),
          settings: SettingView(),
          onLogout: logout,
        );
      default:
        return NcLoadingIndicator();
    }
  }
}

enum HomeState { Login, SelectCourses, Sidebar, None }
