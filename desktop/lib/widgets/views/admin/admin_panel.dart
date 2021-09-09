import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NcView(
      title: "Admin",
      content: Column(
        children: [
          Row(
            children: [
              NcContainer(label: NcTitleText("Stats"), trailingIcon: Icon(Icons.query_stats) ,body: Container(),),
            ],
          )
        ],
      ),
    );
  }
}
