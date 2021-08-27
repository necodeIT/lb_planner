import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NcLogo extends StatelessWidget {
  const NcLogo({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: NcThemes.current == NcThemes.dark
            ? SvgPicture.asset('assets/logoDark.svg')
            : NcThemes.current == NcThemes.light
                ? SvgPicture.asset('assets/logoLight.svg')
                : NcThemes.current == NcThemes.ocean
                    ? SvgPicture.asset('assets/logoOcean.svg')
                    : SvgPicture.network(
                        'https://cdn.shopify.com/s/files/1/0496/1029/files/Freesample.svg'));
  }
}
