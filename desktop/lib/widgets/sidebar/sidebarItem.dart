import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class SidebarItem extends StatefulWidget {
  SidebarItem(
      {Key? key,
      required this.icon,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  static const double padding = 10;
  static const double radius = 16;

  @override
  _SidebarItem createState() => _SidebarItem();
}

class _SidebarItem extends State<SidebarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isSelected ? null : widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInCubic,
        margin: EdgeInsets.only(top: NcSpacing.smallSpacing),
        padding: EdgeInsets.all(SidebarItem.padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(SidebarItem.radius),
          ),
          color: widget.isSelected
              ? NcThemes.current.accentColor
              : NcThemes.current.secondaryColor,
          boxShadow: widget.isSelected ? ncShadow : null,
        ),
        child: Icon(
          widget.icon,
          color: widget.isSelected
              ? NcThemes.current.buttonTextColor
              : NcThemes.current.textColor,
        ),
      ),
    );
  }
}
