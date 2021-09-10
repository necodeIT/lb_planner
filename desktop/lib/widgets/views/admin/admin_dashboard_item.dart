import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class AdminDashboardItem extends StatelessWidget {
  const AdminDashboardItem({Key? key, required this.icon, required this.number, required this.headline, this.body}) : super(key: key);

  final IconData icon;
  final String number;
  final String headline;
  final Widget? body;

  static const double numberFontSize = 20;
  static const double headlineFontSize = 10;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NcContainer(
        label: SizedBox.shrink(),
        labelPadding: false,
        body: Row(
          children: [
            Icon(icon, size: numberFontSize),
            NcSpacing.small(),
            Column(
              children: [
                // TODO: Anzahl ausgeben
                NcBodyText(number, fontSize: numberFontSize),
                NcSpacing.xs(),
                NcBodyText(headline, fontSize: headlineFontSize),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
