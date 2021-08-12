import 'package:flutter/material.dart';
import 'package:lb_planner/widgets/defaults/default.dart' as Default;

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Default.Gradient(
      child: SafeArea(
        child: Text("Yaaaayy, now gimme catgirls. no seriosly. give 'em to me"),
      ),
    );
  }
}
