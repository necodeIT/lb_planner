import 'package:flutter/material.dart';
import 'package:lb_planner/widgets/Home/dashboard/dashboard.dart';
import 'package:lb_planner/widgets/defaults/default.dart' as Default;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Default.Gradient(
      child: Scaffold(
        body: Dashboard(),
        appBar: AppBar(
          title: Text(
            "Dashboard",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
