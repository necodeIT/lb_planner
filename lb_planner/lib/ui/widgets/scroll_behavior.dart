import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcScrollBehavior extends ScrollBehavior {
  static const ScrollPhysics physics = const BouncingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => NcScrollbar(child: child);

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => physics;
}
