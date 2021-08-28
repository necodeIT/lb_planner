import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcLogo extends StatelessWidget {
  const NcLogo({Key? key, this.width, this.height, this.aliignment = Alignment.center}) : super(key: key);

  final double? width;
  final double? height;
  final Alignment aliignment;

  static const rawSvg = '<svg xmlns="http://www.w3.org/2000/svg" width="425.491" height="386" viewBox="0 0 425.491 386">' +
      '<g id="Dark1" transform="translate(-7529.924 6213.369)" shape-rendering="crispEdges">' +
      '<text id="LP" transform="translate(7693.924 -5900.369)" fill="${NcVectorImage.textColor}" font-size="290" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="-163.196" y="0">LP</tspan></text>' +
      '<path id="Path_13" data-name="Path 13" d="M-2975.339,4671.468l93.269,82.859v-82.859Z" transform="translate(10837.486 -10771.371)" fill="${NcVectorImage.accentColor}"/>' +
      '</g></svg>';

  @override
  Widget build(BuildContext context) {
    return NcVectorImage(
      code: rawSvg,
      width: width,
      height: height,
      aliignment: aliignment,
    );
  }
}
