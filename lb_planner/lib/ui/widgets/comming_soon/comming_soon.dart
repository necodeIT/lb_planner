import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:url_launcher/url_launcher.dart';

class NcCommingSoon extends StatelessWidget {
  const NcCommingSoon({Key? key, this.alignment = Alignment.center, this.type = NcCommingSoonSvgType.One}) : super(key: key);

  final Alignment alignment;
  final NcCommingSoonSvgType type;

  static const roadmapURL = "https://lbplanner.notion.site/a4e2baf2676a4ce08696fb731afd8be7?v=1fc664711d944fcbbf9aa0db2958551e";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: LayoutBuilder(
        builder: (context, size) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NcTitleText(
              "Coming soon!",
              fontSize: size.maxWidth * .05,
            ),
            NcSpacing.medium(),
            Expanded(child: NcVectorImage(code: ncCommingSoonSVGs[NcCommingSoonSvgType.values.indexOf(type)])),
            NcSpacing.medium(),
            NcTextButton(
              text: "Check out our roadmap for more inforamtion",
              trailingIcon: Icon(
                Icons.arrow_right_alt,
                color: NcThemes.current.textColor,
              ),
              fontSize: size.maxWidth * .03,
              onTap: () {
                launch(roadmapURL);
              },
            ),
            NcSpacing.xs(),
          ],
        ),
      ),
    );
  }
}
