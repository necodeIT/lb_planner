import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return NcView(title: "Admin", content: NcGridView(children: []));
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
