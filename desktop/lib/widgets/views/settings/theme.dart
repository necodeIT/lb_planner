import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class ThemeItem extends StatefulWidget {
  const ThemeItem({Key? key, required this.theme}) : super(key: key);

  final String theme;

  static const double size = 60;

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
        // margin: EdgeInsets.all(ncShadow.first.blurRadius + NcSpacing.xsSpacing),
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.all(8),
              height: ThemeItem.size,
              width: ThemeItem.size,
              decoration: BoxDecoration(
                color: NcThemes.all[widget.theme]!.secondaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isCurrent ? NcThemes.current.accentColor : Colors.transparent, width: 2),
                boxShadow: ncShadow,
              ),
              child: Icon(
                NcThemes.all[widget.theme]!.icon,
                color: NcThemes.all[widget.theme]!.iconColor,
              ),
            ),
            NcSpacing.small(),
            NcCaptionText(
              widget.theme,
              fontSize: 20,
            ),
            // NcSpacing.small(),
          ],
        ),
      ),
    );
  }
}
