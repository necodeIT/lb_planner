import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcScrollbar extends StatefulWidget {
  const NcScrollbar({Key? key, required this.child, this.isAlwaysShown = false}) : super(key: key);

  final Widget child;
  final bool isAlwaysShown;

  static const double scrollbarWidth = 5;
  static const double padding = 2;

  @override
  _NcScrollbarState createState() => _NcScrollbarState();
}

class _NcScrollbarState extends State<NcScrollbar> {
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thickness: NcScrollbar.scrollbarWidth,
      isAlwaysShown: widget.isAlwaysShown,
      thumbColor: NcThemes.current.accentColor,
      radius: Radius.circular(ncRadius),
      child: widget.child,
    );
  }
}
