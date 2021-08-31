import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/themes/theme.dart';

class ThemeItem extends StatefulWidget {
  const ThemeItem({Key? key, required this.theme}) : super(key: key);

  final String theme;

  @override
  _ThemeItemState createState() => _ThemeItemState();
}

class _ThemeItemState extends State<ThemeItem> {
  @override
  Widget build(BuildContext context) {
    bool isCurrent = NcThemes.current == NcThemes.all[widget.theme];

    return GestureDetector(
      onTap: () {
        setState(() => NcThemes.current = NcThemes.all[widget.theme] ?? NcThemes.dark); // dart stupid
      },
      child: Container(
        decoration: BoxDecoration(
          color: NcThemes.all[widget.theme]!.secondaryColor,
          borderRadius: BorderRadius.circular(ncRadius),
          border: isCurrent ? Border.all(color: NcThemes.current.accentColor, width: 5) : null,
          boxShadow: ncShadow,
        ),
        child: Icon(
          NcThemes.all[widget.theme]!.icon,
          color: NcThemes.all[widget.theme]!.iconColor,
        ),
      ),
    );
  }
}
